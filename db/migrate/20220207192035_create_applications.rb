class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.column :provided_id, :string, null: false
      t.timestamps
    end
  end
end
