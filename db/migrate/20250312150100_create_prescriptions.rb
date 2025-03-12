class CreatePrescriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :prescriptions do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :issue_date

      t.timestamps
    end
  end
end
