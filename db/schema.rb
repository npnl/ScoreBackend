# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_23_085728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armtest_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "arm_type"
    t.string "activity"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_armtest_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_armtest_form_rows_on_subject_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.bigint "subject_id"
    t.boolean "nihss", default: false
    t.boolean "fma", default: false
    t.boolean "wmft", default: false
    t.boolean "sis", default: false
    t.boolean "mrs", default: false
    t.boolean "mas", default: false
    t.boolean "mmt", default: false
    t.boolean "barthel", default: false
    t.boolean "arm", default: false
    t.string "date"
    t.bigint "user_id"
    t.index ["subject_id"], name: "index_assessments_on_subject_id"
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "barthel_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "activity"
    t.string "score"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_barthel_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_barthel_form_rows_on_subject_id"
  end

  create_table "fma_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "category"
    t.string "posture"
    t.string "movement"
    t.string "extremity"
    t.integer "score"
    t.integer "item_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_fma_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_fma_form_rows_on_subject_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_code"
  end

  create_table "mas_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "muscle_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_mas_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_mas_form_rows_on_subject_id"
  end

  create_table "mmt_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "muscle_name"
    t.integer "mmt_score"
    t.integer "rom_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_mmt_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_mmt_form_rows_on_subject_id"
  end

  create_table "mrs_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_mrs_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_mrs_form_rows_on_subject_id"
  end

  create_table "nihss_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "domain"
    t.string "specific"
    t.integer "fas_score"
    t.integer "item_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_nihss_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_nihss_form_rows_on_subject_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "sis_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "question_id"
    t.string "selected_option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_sis_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_sis_form_rows_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_subjects_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "email"
    t.string "name"
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  create_table "wmft_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "task"
    t.string "time"
    t.string "fas_score"
    t.string "arm_type"
    t.integer "item_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.index ["assessment_id"], name: "index_wmft_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_wmft_form_rows_on_subject_id"
  end

  add_foreign_key "armtest_form_rows", "assessments"
  add_foreign_key "armtest_form_rows", "subjects"
  add_foreign_key "assessments", "subjects"
  add_foreign_key "assessments", "users"
  add_foreign_key "barthel_form_rows", "assessments"
  add_foreign_key "barthel_form_rows", "subjects"
  add_foreign_key "fma_form_rows", "assessments"
  add_foreign_key "fma_form_rows", "subjects"
  add_foreign_key "mas_form_rows", "assessments"
  add_foreign_key "mas_form_rows", "subjects"
  add_foreign_key "mmt_form_rows", "assessments"
  add_foreign_key "mmt_form_rows", "subjects"
  add_foreign_key "mrs_form_rows", "assessments"
  add_foreign_key "mrs_form_rows", "subjects"
  add_foreign_key "nihss_form_rows", "assessments"
  add_foreign_key "nihss_form_rows", "subjects"
  add_foreign_key "sessions", "users"
  add_foreign_key "sis_form_rows", "assessments"
  add_foreign_key "sis_form_rows", "subjects"
  add_foreign_key "subjects", "groups"
  add_foreign_key "users", "groups"
  add_foreign_key "wmft_form_rows", "assessments"
  add_foreign_key "wmft_form_rows", "subjects"
end
