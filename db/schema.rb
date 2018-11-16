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

ActiveRecord::Schema.define(version: 2018_11_16_232406) do

  create_table "armies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.integer "victory_points"
    t.bigint "battle_id"
    t.bigint "battle_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_id"], name: "index_armies_on_battle_id"
    t.index ["battle_order_id"], name: "index_armies_on_battle_order_id"
  end

  create_table "armies_units", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "army_id", null: false
    t.bigint "unit_id", null: false
    t.index ["army_id", "unit_id"], name: "index_armies_units_on_army_id_and_unit_id"
    t.index ["unit_id", "army_id"], name: "index_armies_units_on_unit_id_and_army_id"
  end

  create_table "battle_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "scenario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scenario_id"], name: "index_battle_orders_on_scenario_id"
  end

  create_table "battle_orders_units", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "battle_order_id", null: false
    t.bigint "unit_id", null: false
    t.index ["battle_order_id", "unit_id"], name: "index_battle_orders_units_on_battle_order_id_and_unit_id"
    t.index ["unit_id", "battle_order_id"], name: "index_battle_orders_units_on_unit_id_and_battle_order_id"
  end

  create_table "battles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "campaign_id"
    t.bigint "scenario_id"
    t.integer "current_turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_battles_on_campaign_id"
    t.index ["game_id"], name: "index_battles_on_game_id"
    t.index ["scenario_id"], name: "index_battles_on_scenario_id"
  end

  create_table "campaigns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_campaigns_on_game_id"
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_units", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "unit_id", null: false
    t.index ["game_id", "unit_id"], name: "index_games_units_on_game_id_and_unit_id"
    t.index ["unit_id", "game_id"], name: "index_games_units_on_unit_id_and_game_id"
  end

  create_table "hexes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "game_id"
    t.integer "terrain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_hexes_on_game_id"
  end

  create_table "scenarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "game_id"
    t.string "title"
    t.integer "turns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_scenarios_on_game_id"
  end

  create_table "units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "strength"
    t.integer "type_of"
    t.integer "starting_hex"
    t.string "name"
    t.integer "status"
    t.integer "vp_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
