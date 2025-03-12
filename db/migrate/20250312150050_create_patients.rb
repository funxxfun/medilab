class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.integer :age
      t.text :medical_history
      t.string :insurance_number, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
