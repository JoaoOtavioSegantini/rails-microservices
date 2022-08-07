class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.references :order, null: false, foreign_key: true, type: :uuid
      t.string :payment_type
      t.string :description
      t.date :payment_date

      t.timestamps
    end
  end
end
