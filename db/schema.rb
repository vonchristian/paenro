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

ActiveRecord::Schema.define(version: 20170330232849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "client_id"
    t.uuid "barangay_id"
    t.uuid "municipality_id"
    t.uuid "sitio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barangay_id"], name: "index_addresses_on_barangay_id"
    t.index ["client_id"], name: "index_addresses_on_client_id"
    t.index ["municipality_id"], name: "index_addresses_on_municipality_id"
    t.index ["sitio_id"], name: "index_addresses_on_sitio_id"
  end

  create_table "barangays", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipality_id"], name: "index_barangays_on_municipality_id"
  end

  create_table "carts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "client_requirements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "client_id"
    t.uuid "requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_requirements_on_client_id"
    t.index ["requirement_id"], name: "index_client_requirements_on_requirement_id"
  end

  create_table "clients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "contact_number"
    t.integer "sex", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.uuid "program_id"
    t.index ["program_id"], name: "index_clients_on_program_id"
  end

  create_table "croppings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "farm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "crop_id"
    t.index ["crop_id"], name: "index_croppings_on_crop_id"
    t.index ["farm_id"], name: "index_croppings_on_farm_id"
  end

  create_table "crops", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "client_id"
    t.decimal "area"
    t.boolean "suitable", default: false
    t.boolean "cleared", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "harvested", default: false
    t.string "name"
    t.index ["client_id"], name: "index_farms_on_client_id"
  end

  create_table "harvests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "farm_id"
    t.decimal "weight"
    t.decimal "gross_income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "cropping_id"
    t.datetime "harvest_start_date"
    t.datetime "harvest_end_date"
    t.index ["cropping_id"], name: "index_harvests_on_cropping_id"
    t.index ["farm_id"], name: "index_harvests_on_farm_id"
  end

  create_table "line_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "order_id"
    t.uuid "stock_id"
    t.uuid "cart_id"
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["stock_id"], name: "index_line_items_on_stock_id"
  end

  create_table "municipalities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "client_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "program_locations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "barangay_id"
    t.uuid "program_id"
    t.decimal "target_area"
    t.decimal "beneficiary_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barangay_id"], name: "index_program_locations_on_barangay_id"
    t.index ["program_id"], name: "index_program_locations_on_program_id"
  end

  create_table "programs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_programs_on_name", unique: true
  end

  create_table "requirements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_requirements_on_name", unique: true
  end

  create_table "sitios", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "barangay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barangay_id"], name: "index_sitios_on_barangay_id"
  end

  create_table "stocks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "product_id"
    t.decimal "quantity"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.index ["product_id"], name: "index_stocks_on_product_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "barangays"
  add_foreign_key "addresses", "clients"
  add_foreign_key "addresses", "municipalities"
  add_foreign_key "addresses", "sitios"
  add_foreign_key "barangays", "municipalities"
  add_foreign_key "carts", "users"
  add_foreign_key "client_requirements", "clients"
  add_foreign_key "client_requirements", "requirements"
  add_foreign_key "clients", "programs"
  add_foreign_key "croppings", "crops"
  add_foreign_key "croppings", "farms"
  add_foreign_key "farms", "clients"
  add_foreign_key "harvests", "croppings"
  add_foreign_key "harvests", "farms"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "stocks"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "program_locations", "barangays"
  add_foreign_key "program_locations", "programs"
  add_foreign_key "sitios", "barangays"
  add_foreign_key "stocks", "products"
end
