class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :payments, dependent: :destroy

  accepts_nested_attributes_for :order_items

  before_create :adjust_total
  before_update :adjust_balance, :adjust_total

  validates :status, :balance, :total, :order_date, presence: true

  private

  def get_total
    late_tax = self.late_fee != nil ? self.late_fee : 0
    delivery_tax = self.delivery_fee != nil ? self.delivery_fee : 0
     total = get_items_total + late_tax + delivery_tax - (self.discount ||= 0)
     total
  end

  def get_items_total
    total_items = 0
    order_items.each do |item|
      total_items += item.product.price * (item.qtd).to_i
    end
    total_items
  end

  def total_payments
    total = 0
    payments.each do |payment|
      total += payment.amount
    end
    total
  end

  def adjust_balance 
    if self.balance != (get_total - total_payments) 
      self.balance = get_total - total_payments
    end

    message = prepare(self)
    new_message(message)
  end

  def adjust_total
    if self.total != get_total 
      self.total = get_total
    end

    message = prepare(self)
    new_message(message)
  end

  def prepare(order)
        prepared_order = {
            :order => {
                :id => order.id,
                :customer_id => order.customer_id,
                :status => order.status,
                :discount => order.discount,
                :total => order.total,
                :order_date => order.order_date.strftime("%Y-%m-%d")
            }
          }

        items_final = []
        order.order_items.each do |item|
            items['id'] = item.id
            items['order_id'] = item.order_id
            items['qtd'] = item.qtd
            items['total'] = item.qtd * item.product.price
            items['product']['id'] = item.product_id
            items['product']['name'] = item.product.name
            items['product']['price'] = item.product.price
            items['product']['description'] = item.product.description
            items_final += items
        end
        prepared_order["order"]["items"] = items_final
        return prepared_order
  end

  def new_message(message)
      Karafka.producer.produce_async(
        topic: 'orders',
        payload: message.to_json
      )
  end

end
