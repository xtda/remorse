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

ActiveRecord::Schema.define(version: 20170516084852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "playerapplications", force: :cascade do |t|
    t.string "player_battlenettag"
    t.string "player_name"
    t.string "player_realm"
    t.string "player_class"
    t.string "player_mainspec"
    t.integer "player_mainspec_awt"
    t.string "player_offspec"
    t.integer "player_offspec_awt"
    t.text "player_offspec_confidence"
    t.text "player_alts"
    t.text "player_previousguilds"
    t.string "link_wowprogress"
    t.string "link_warcraftlogs"
    t.text "question_theorycraft"
    t.text "question_whyyou"
    t.text "question_whyremorse"
    t.text "question_anythingelse"
    t.string "viewkey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_battlenettag"], name: "index_playerapplications_on_player_battlenettag"
    t.index ["player_class"], name: "index_playerapplications_on_player_class"
    t.index ["player_name"], name: "index_playerapplications_on_player_name"
    t.index ["viewkey"], name: "index_playerapplications_on_viewkey"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "short_desc"
    t.text "content"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "setting", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting"], name: "index_settings_on_setting"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "access_level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
