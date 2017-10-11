# encoding: UTF-8

ActiveRecord::Schema.define(version: 20171010200411) do

  create_table "games", force: :cascade do |t|
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guesses", force: :cascade do |t|
    t.string   "letter"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
  end

end
