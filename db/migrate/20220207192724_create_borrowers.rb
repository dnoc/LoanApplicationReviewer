class CreateBorrowers < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowers do |t|
      t.belongs_to(:loan_applications)
      t.column :name, :string, null: false
      t.column :credit_score, :integer, null: false
      t.timestamps
    end
  end
end
