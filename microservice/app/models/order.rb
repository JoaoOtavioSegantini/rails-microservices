class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :status, :order_date, :total, presence: true

  private

  def self.update_or_create(attributes)
    assign_or_new(attributes).save
  end

  def self.update_or_create!(attributes)
    assign_or_new(attributes).save!
  end
  
  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end
  
end
