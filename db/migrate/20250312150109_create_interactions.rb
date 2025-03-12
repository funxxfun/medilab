class CreateInteractions < ActiveRecord::Migration[8.0]
  def change
    create_table :interactions do |t|
      t.references :medication1, null: false, foreign_key: { to_table: :medications }
      t.references :medication2, null: false, foreign_key: { to_table: :medications }
      t.integer :severity, null: false, default: 0
      t.text :description, null: false

      t.timestamps
    end

    add_index :interactions, [:medication1_id, :medication2_id], unique: true
  end
end
