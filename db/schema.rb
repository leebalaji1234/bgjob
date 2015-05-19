# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150517084431) do

  create_table "answer_records", force: :cascade do |t|
    t.string   "guid",         limit: 255
    t.integer  "userid",       limit: 4
    t.string   "callerid",     limit: 255
    t.string   "source",       limit: 255
    t.string   "destination",  limit: 255
    t.integer  "templateid",   limit: 4
    t.integer  "dialedtime",   limit: 4
    t.integer  "answeredtime", limit: 4
    t.integer  "endtime",      limit: 4
    t.string   "dialstatus",   limit: 255
    t.string   "reason",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "audio_maps", force: :cascade do |t|
    t.integer  "userid",     limit: 4
    t.integer  "audioid",    limit: 4
    t.text     "guid",       limit: 65535
    t.integer  "cliporder",  limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "audio_temps", force: :cascade do |t|
    t.string   "audioname",  limit: 255
    t.text     "flocation",  limit: 65535
    t.integer  "fsize",      limit: 4
    t.text     "ftlocation", limit: 65535
    t.integer  "status",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "audios", force: :cascade do |t|
    t.string   "audioname",  limit: 255
    t.text     "flocation",  limit: 65535
    t.integer  "status",     limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "fsize",      limit: 4
  end

  create_table "authenticates_temps", force: :cascade do |t|
    t.text     "params",     limit: 65535
    t.integer  "status",     limit: 1
    t.text     "guid",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "call_templates", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "desc",       limit: 255
    t.text     "flocation",  limit: 65535
    t.integer  "mode",       limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "csv_file_temps", force: :cascade do |t|
    t.string   "filename",   limit: 255
    t.text     "flocation",  limit: 65535
    t.integer  "fsize",      limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "csv_files", force: :cascade do |t|
    t.string   "filename",   limit: 255
    t.text     "flocation",  limit: 65535
    t.integer  "fsize",      limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "csv_maps", force: :cascade do |t|
    t.integer  "userid",     limit: 4
    t.integer  "csvid",      limit: 4
    t.text     "guid",       limit: 65535
    t.integer  "status",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "generators", force: :cascade do |t|
    t.integer  "userid",         limit: 4
    t.text     "guid",           limit: 65535
    t.text     "csvfile",        limit: 65535
    t.string   "csvcount",       limit: 255
    t.string   "processedcount", limit: 255
    t.integer  "status",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "make_records", force: :cascade do |t|
    t.string   "guid",         limit: 255
    t.integer  "userid",       limit: 4
    t.string   "callerid",     limit: 255
    t.string   "source",       limit: 255
    t.string   "destination",  limit: 255
    t.integer  "templateid",   limit: 4
    t.integer  "dialedtime",   limit: 4
    t.integer  "answeredtime", limit: 4
    t.integer  "endtime",      limit: 4
    t.string   "dialstatus",   limit: 255
    t.string   "reason",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "optin_services", force: :cascade do |t|
    t.string   "phone",      limit: 255
    t.integer  "status",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "records", force: :cascade do |t|
    t.string   "guid",         limit: 255
    t.integer  "userid",       limit: 4
    t.string   "callerid",     limit: 255
    t.string   "source",       limit: 255
    t.string   "destination",  limit: 255
    t.integer  "templateid",   limit: 4
    t.integer  "dialedtime",   limit: 4
    t.integer  "answeredtime", limit: 4
    t.integer  "endtime",      limit: 4
    t.string   "dialstatus",   limit: 255
    t.string   "reason",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "request_receiver_temps", force: :cascade do |t|
    t.text     "params",     limit: 65535
    t.integer  "status",     limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "guid",       limit: 65535
  end

  create_table "request_receivers", force: :cascade do |t|
    t.text     "ori_params", limit: 65535
    t.text     "val_params", limit: 65535
    t.text     "message",    limit: 65535
    t.integer  "code",       limit: 4
    t.text     "guid",       limit: 65535
    t.integer  "status",     limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
