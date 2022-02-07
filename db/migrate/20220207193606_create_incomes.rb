class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.belongs_to(:applications)
      t.column :name, :string, null: false
      t.column :kind, :string, null: false
      t.column :monthly_amount, :decimal, precision: 9, scale: 2
      t.timestamps
    end
  end
end
