class CreateMonitorings < ActiveRecord::Migration[8.1]
  def change
    create_table :monitorings do |t|
      t.string :power_status
      t.string :temp_status
      t.references :truck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
