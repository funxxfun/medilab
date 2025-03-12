# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_12_150109) do
  create_table "interactions", force: :cascade do |t|
    t.integer "medication1_id", null: false
    t.integer "medication2_id", null: false
    t.integer "severity", default: 0, null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication1_id", "medication2_id"], name: "index_interactions_on_medication1_id_and_medication2_id", unique: true
    t.index ["medication1_id"], name: "index_interactions_on_medication1_id"
    t.index ["medication2_id"], name: "index_interactions_on_medication2_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.string "dosage_form"
    t.string "strength"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age"
    t.text "medical_history"
    t.string "insurance_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insurance_number"], name: "index_patients_on_insurance_number", unique: true
  end

  create_table "prescription_items", force: :cascade do |t|
    t.integer "prescription_id", null: false
    t.integer "medication_id", null: false
    t.string "dosage"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_id"], name: "index_prescription_items_on_medication_id"
    t.index ["prescription_id"], name: "index_prescription_items_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.date "issue_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  add_foreign_key "interactions", "medications", column: "medication1_id"
  add_foreign_key "interactions", "medications", column: "medication2_id"
  add_foreign_key "prescription_items", "medications"
  add_foreign_key "prescription_items", "prescriptions"
  add_foreign_key "prescriptions", "patients"
end
