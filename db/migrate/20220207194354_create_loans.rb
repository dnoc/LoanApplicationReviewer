class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.belongs_to(:applications)
      t.column :principal_amount,  :decimal, precision: 9, scale: 2
      t.column :years, :integer, null: false
      t.column :rate, :decimal, precision: 5, scale: 4
      t.column :monthly_payment, :decimal, precision: 9, scale: 2
      t.timestamps
    end
  end
end
