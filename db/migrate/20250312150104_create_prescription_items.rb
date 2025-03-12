class CreatePrescriptionItems < ActiveRecord::Migration[8.0]
  def change
    create_table :prescription_items do |t|
      t.references :prescription, null: false, foreign_key: true
      t.references :medication, null: false, foreign_key: true
      t.string :dosage
      t.text :instructions

      t.timestamps
    end
  end
end
