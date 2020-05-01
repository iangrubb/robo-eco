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

ActiveRecord::Schema.define(version: 2020_05_01_030950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blueprints", force: :cascade do |t|
    t.integer "effective_production_time"
    t.bigint "robot_id", null: false
    t.bigint "product_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_type_id"], name: "index_blueprints_on_product_type_id"
    t.index ["robot_id"], name: "index_blueprints_on_robot_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "robot_id", null: false
    t.bigint "connected_robot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connected_robot_id"], name: "index_connections_on_connected_robot_id"
    t.index ["robot_id"], name: "index_connections_on_robot_id"
  end

  create_table "daily_records", force: :cascade do |t|
    t.integer "total_satisfaction"
    t.string "activity"
    t.bigint "robot_id", null: false
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_daily_records_on_day_id"
    t.index ["robot_id"], name: "index_daily_records_on_robot_id"
  end

  create_table "days", force: :cascade do |t|
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "influences", force: :cascade do |t|
    t.integer "strength"
    t.bigint "influencing_robot_id", null: false
    t.bigint "influenced_robot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["influenced_robot_id"], name: "index_influences_on_influenced_robot_id"
    t.index ["influencing_robot_id"], name: "index_influences_on_influencing_robot_id"
  end

  create_table "intrinsic_desires", force: :cascade do |t|
    t.integer "strength"
    t.bigint "robot_id", null: false
    t.bigint "product_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_type_id"], name: "index_intrinsic_desires_on_product_type_id"
    t.index ["robot_id"], name: "index_intrinsic_desires_on_robot_id"
  end

  create_table "product_items", force: :cascade do |t|
    t.integer "current_durability"
    t.bigint "robot_id", null: false
    t.bigint "product_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_type_id"], name: "index_product_items_on_product_type_id"
    t.index ["robot_id"], name: "index_product_items_on_robot_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.integer "max_durability"
    t.integer "base_production_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "production_orders", force: :cascade do |t|
    t.integer "remaining_production_time"
    t.bigint "blueprint_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blueprint_id"], name: "index_production_orders_on_blueprint_id"
  end

  create_table "robots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shipping_orders", force: :cascade do |t|
    t.bigint "connection_id", null: false
    t.string "dependency_type", null: false
    t.bigint "dependency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connection_id"], name: "index_shipping_orders_on_connection_id"
    t.index ["dependency_type", "dependency_id"], name: "index_shipping_orders_on_dependency_type_and_dependency_id"
  end

  add_foreign_key "blueprints", "product_types"
  add_foreign_key "blueprints", "robots"
  add_foreign_key "connections", "robots"
  add_foreign_key "daily_records", "days"
  add_foreign_key "daily_records", "robots"
  add_foreign_key "intrinsic_desires", "product_types"
  add_foreign_key "intrinsic_desires", "robots"
  add_foreign_key "product_items", "product_types"
  add_foreign_key "product_items", "robots"
  add_foreign_key "production_orders", "blueprints"
  add_foreign_key "shipping_orders", "connections"
end
