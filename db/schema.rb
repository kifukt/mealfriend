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

ActiveRecord::Schema.define(version: 20180120141124) do

  create_table "diaries", force: :cascade do |t|
    t.integer "user_id"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.float "calories"
    t.float "carbohydrates"
    t.float "fats"
    t.string "name"
    t.float "proteins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intakes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ingredient_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_intakes_on_ingredient_id"
    t.index ["user_id"], name: "index_intakes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.date "birthdate"
    t.integer "height"
    t.boolean "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "token"
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["token"], name: "index_users_on_token"
  end

end
