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

ActiveRecord::Schema.define(version: 2019_01_22_210421) do

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
    t.datetime "deleted_at"
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
    t.datetime "deleted_at"
    t.string "comments"
    t.boolean "moca", default: false
    t.boolean "mal", default: false
    t.boolean "moca_alternate", default: false
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
    t.integer "total_score"
    t.datetime "deleted_at"
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
    t.string "comment"
    t.integer "fma_ue_total"
    t.integer "fma_le_total"
    t.integer "fma_sense_total"
    t.integer "fma_total"
    t.datetime "deleted_at"
    t.index ["assessment_id"], name: "index_fma_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_fma_form_rows_on_subject_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_code"
    t.datetime "deleted_at"
  end

  create_table "mal_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "assessment_id"
    t.date "date"
    t.string "activity_description"
    t.integer "amount_scale"
    t.integer "how_well_scale"
    t.integer "if_not_why"
    t.string "comments"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_mal_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_mal_form_rows_on_subject_id"
  end

  create_table "mas_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "muscle_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.datetime "deleted_at"
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
    t.datetime "deleted_at"
    t.index ["assessment_id"], name: "index_mmt_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_mmt_form_rows_on_subject_id"
  end

  create_table "moca_alternate_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "assessment_id"
    t.date "date"
    t.integer "visuospatial_executive"
    t.integer "naming"
    t.integer "attention_1"
    t.integer "attention_2"
    t.integer "attention_3"
    t.integer "language_1"
    t.integer "language_2"
    t.integer "abstraction"
    t.integer "delayed_recall"
    t.integer "orientation"
    t.integer "edu_less_than_12_yrs"
    t.integer "total_score"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_moca_alternate_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_moca_alternate_form_rows_on_subject_id"
  end

  create_table "moca_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "assessment_id"
    t.date "date"
    t.integer "visuospatial_executive"
    t.integer "naming"
    t.integer "attention_1"
    t.integer "attention_2"
    t.integer "attention_3"
    t.integer "language_1"
    t.integer "language_2"
    t.integer "abstraction"
    t.integer "delayed_recall"
    t.integer "orientation"
    t.integer "edu_less_than_12_yrs"
    t.integer "total_score"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_moca_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_moca_form_rows_on_subject_id"
  end

  create_table "mrs_form_rows", force: :cascade do |t|
    t.bigint "subject_id"
    t.date "date"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assessment_id"
    t.datetime "deleted_at"
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
    t.integer "loc_total"
    t.integer "motor_total"
    t.integer "nihss_total"
    t.string "comment"
    t.datetime "deleted_at"
    t.index ["assessment_id"], name: "index_nihss_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_nihss_form_rows_on_subject_id"
  end

  create_table "reset_passwords", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "requested_at"
    t.string "reset_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reset_passwords_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "deleted_at"
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
    t.datetime "deleted_at"
    t.index ["assessment_id"], name: "index_sis_form_rows_on_assessment_id"
    t.index ["subject_id"], name: "index_sis_form_rows_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
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
    t.boolean "admin", default: false
    t.datetime "deleted_at"
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
    t.integer "median_time"
    t.integer "total_fas"
    t.integer "avg_strength"
    t.string "comment"
    t.datetime "deleted_at"
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
  add_foreign_key "mal_form_rows", "assessments"
  add_foreign_key "mal_form_rows", "subjects"
  add_foreign_key "mas_form_rows", "assessments"
  add_foreign_key "mas_form_rows", "subjects"
  add_foreign_key "mmt_form_rows", "assessments"
  add_foreign_key "mmt_form_rows", "subjects"
  add_foreign_key "moca_alternate_form_rows", "assessments"
  add_foreign_key "moca_alternate_form_rows", "subjects"
  add_foreign_key "moca_form_rows", "assessments"
  add_foreign_key "moca_form_rows", "subjects"
  add_foreign_key "mrs_form_rows", "assessments"
  add_foreign_key "mrs_form_rows", "subjects"
  add_foreign_key "nihss_form_rows", "assessments"
  add_foreign_key "nihss_form_rows", "subjects"
  add_foreign_key "reset_passwords", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "sis_form_rows", "assessments"
  add_foreign_key "sis_form_rows", "subjects"
  add_foreign_key "subjects", "groups"
  add_foreign_key "users", "groups"
  add_foreign_key "wmft_form_rows", "assessments"
  add_foreign_key "wmft_form_rows", "subjects"
end
