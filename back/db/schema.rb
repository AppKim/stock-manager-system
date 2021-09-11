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

ActiveRecord::Schema.define(version: 2021_09_04_052233) do

  create_table "brands", primary_key: "br_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "br_name", limit: 50, null: false, comment: "ブランド名"
  end

  create_table "categories", primary_key: "ca_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "ca_name", limit: 50, null: false
  end

  create_table "companies", primary_key: "co_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "co_name", limit: 50, null: false, comment: "会社名"
    t.string "co_address", null: false, comment: "会社住所"
    t.string "co_profile_img", comment: "会社ロゴイメージ"
  end

  create_table "histories", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "hi_co_id", null: false
    t.text "hi_comments", null: false
    t.index ["hi_co_id"], name: "fk_rails_c82d41be36"
  end

  create_table "products", primary_key: "pr_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "pr_ca_id", null: false
    t.integer "pr_br_id", null: false
    t.integer "pr_us_id", null: false
    t.string "pr_price", limit: 50
    t.string "pr_barcode"
    t.string "pr_img"
    t.datetime "pr_expiration", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pr_name"
    t.index ["pr_br_id"], name: "fk_rails_eada080a8c"
    t.index ["pr_ca_id"], name: "fk_rails_8ad1770423"
    t.index ["pr_us_id"], name: "fk_rails_276878f622"
  end

  create_table "roles", primary_key: "ro_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "ro_name", limit: 10, null: false, comment: "ロール名"
  end

  create_table "sessions", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "se_us_id", null: false
    t.string "se_id", null: false
    t.index ["se_us_id"], name: "fk_rails_e2b3e6c37a"
  end

  create_table "stocks", primary_key: "st_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "st_pr_id", null: false
    t.integer "st_exist", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["st_pr_id"], name: "fk_rails_727a2f2c9f"
  end

  create_table "users", primary_key: "us_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "us_ro_id", null: false
    t.integer "us_co_id", null: false
    t.string "us_login_id", limit: 50, null: false
    t.string "us_login_pw", null: false
    t.index ["us_co_id"], name: "fk_rails_520de6bea1"
    t.index ["us_ro_id"], name: "fk_rails_886f06a293"
  end

  add_foreign_key "histories", "companies", column: "hi_co_id", primary_key: "co_id"
  add_foreign_key "products", "brands", column: "pr_br_id", primary_key: "br_id"
  add_foreign_key "products", "categories", column: "pr_ca_id", primary_key: "ca_id"
  add_foreign_key "products", "users", column: "pr_us_id", primary_key: "us_id"
  add_foreign_key "sessions", "users", column: "se_us_id", primary_key: "us_id"
  add_foreign_key "stocks", "products", column: "st_pr_id", primary_key: "pr_id"
  add_foreign_key "users", "companies", column: "us_co_id", primary_key: "co_id"
  add_foreign_key "users", "roles", column: "us_ro_id", primary_key: "ro_id"
end
