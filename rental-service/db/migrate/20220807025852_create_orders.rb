class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :customer, null: false, foreign_key: true, type: :uuid
      t.string :status
      t.decimal :discount, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2, :default => 0
      t.datetime :order_date
      t.decimal :downpayment, precision: 10, scale: 2
      t.decimal :delivery_fee, precision: 10, scale: 2
      t.decimal :late_fee, precision: 10, scale: 2
      t.decimal :balance, precision: 10, scale: 2, :default => 0
      t.datetime :return_date

      t.timestamps
    end
  end
end
