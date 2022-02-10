class CreateLiabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :liabilities do |t|
      t.belongs_to(:loan_applications)
      t.column :comma_separated_names, :string, null: false
      t.column :kind, :string, null: false
      t.column :monthly_payment, :decimal, precision: 9, scale: 2
      t.column :outstanding_balance, :decimal, precision: 9, scale: 2
      t.timestamps
    end
  end
end
