# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_05_050829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_books_on_name", unique: true
  end

  create_table "books_spells", id: false, force: :cascade do |t|
    t.bigint "spell_id", null: false
    t.bigint "book_id", null: false
    t.index ["book_id", "spell_id"], name: "index_books_spells_on_book_id_and_spell_id", unique: true
  end

  create_table "spells", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.integer "level", null: false
    t.string "school", null: false
    t.boolean "bard", default: false
    t.boolean "cleric", default: false
    t.boolean "druid", default: false
    t.boolean "paladin", default: false
    t.boolean "ranger", default: false
    t.boolean "sorcerer", default: false
    t.boolean "warlock", default: false
    t.boolean "wizard", default: false
    t.string "concentration", null: false
    t.string "description", limit: 4096, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_spells_on_name", unique: true
  end

end
