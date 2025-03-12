class CreateMedications < ActiveRecord::Migration[8.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dosage_form
      t.string :strength
      t.text :description

      t.timestamps
    end
  end
end
