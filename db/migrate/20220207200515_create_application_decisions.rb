class CreateApplicationDecisions < ActiveRecord::Migration[7.0]
  def change
    create_table :application_decisions do |t|
      t.belongs_to(:loan_applications)
      t.column :approved, :boolean, null: false, default: false
      t.column :dti, :decimal, precision: 5, scale: 4
      t.column :credit_score, :integer, null: false
      t.timestamps
    end
  end
end
