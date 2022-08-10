class Customer < ApplicationRecord
    has_many :orders, dependent: :destroy

    validates :name, :email, :phone, presence: true
end
