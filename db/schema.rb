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

ActiveRecord::Schema.define(version: 2022_02_07_200515) do

  create_table "application_decisions", force: :cascade do |t|
    t.integer "loan_applications_id"
    t.boolean "approved", default: false, null: false
    t.decimal "dti", precision: 5, scale: 4
    t.integer "credit_score", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_applications_id"], name: "index_application_decisions_on_loan_applications_id"
  end

  create_table "borrowers", force: :cascade do |t|
    t.integer "loan_applications_id"
    t.string "name", null: false
    t.integer "credit_score", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_applications_id"], name: "index_borrowers_on_loan_applications_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "loan_applications_id"
    t.string "name", null: false
    t.string "kind", null: false
    t.decimal "monthly_amount", precision: 9, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_applications_id"], name: "index_incomes_on_loan_applications_id"
  end

  create_table "liabilities", force: :cascade do |t|
    t.integer "loan_applications_id"
    t.string "comma_separated_names", null: false
    t.string "kind", null: false
    t.decimal "monthly_payment", precision: 9, scale: 2
    t.decimal "outstanding_balance", precision: 9, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_applications_id"], name: "index_liabilities_on_loan_applications_id"
  end

  create_table "loan_applications", force: :cascade do |t|
    t.string "provided_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "loan_applications_id"
    t.decimal "principal_amount", precision: 9, scale: 2
    t.integer "years", null: false
    t.decimal "rate", precision: 5, scale: 4
    t.decimal "monthly_payment", precision: 9, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_applications_id"], name: "index_loans_on_loan_applications_id"
  end

end
