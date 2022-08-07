class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :payments

  before_validation :adjust_total
  before_update :adjust_balance

  validates :status, :balance, :total, :order_date, presence: true

  private

  def get_total
     total = get_items_total + self.late_fee + self.delivery_fee - self.discount
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
  end

  def adjust_total
    if self.total != get_total 
      self.total = get_total
    end
  end

end
