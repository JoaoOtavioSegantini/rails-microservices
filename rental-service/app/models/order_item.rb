class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order


  before_validation :adjust_balance, :adjust_total
  before_destroy :adjust_balance, :adjust_total

  validates :qtd, presence: true


  private

  def get_total
    total = get_items_total + self.order.late_fee + self.order.delivery_fee - self.order.discount
    total
 end

 def get_items_total
   total_items = 0
   self.order.order_items.each do |item|
     total_items += item.product.price * (item.qtd).to_i
   end
   total_items
 end

 def total_payments
   total = 0
   self.order.payments.each do |payment|
     total += payment.amount
   end
   total
 end

 def adjust_balance 
   if self.order.balance != (get_total - total_payments) 
     self.order.balance = get_total - total_payments
   end
 end

 def adjust_total
   if self.order.total != get_total 
     self.order.total = get_total
   end
 end

end
