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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111204214904) do

  create_table "api_tokens", :force => true do |t|
    t.string   "authentication_token", :null => false
    t.string   "description",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shared_secret"
  end

  add_index "api_tokens", ["authentication_token"], :name => "index_api_tokens_on_authentication_token", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "description",                         :null => false
    t.integer  "user_id",                             :null => false
    t.integer  "idea_id",                             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ratings_count",        :default => 0, :null => false
    t.float    "average_rating_score"
  end

  add_index "comments", ["idea_id"], :name => "index_comments_on_idea_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "ideas", :force => true do |t|
    t.text     "description",                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                               :null => false
    t.integer  "subject_id",                          :null => false
    t.string   "subject_type",                        :null => false
    t.integer  "ratings_count",        :default => 0, :null => false
    t.integer  "user_id",                             :null => false
    t.float    "average_rating_score"
  end

  add_index "ideas", ["created_at"], :name => "index_ideas_on_created_at"
  add_index "ideas", ["subject_id", "subject_type"], :name => "index_ideas_on_subject_id_and_subject_type"
  add_index "ideas", ["user_id"], :name => "index_ideas_on_user_id"

  create_table "partner_memberships", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.integer  "partner_id",                     :null => false
    t.string   "role",       :default => "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "partner_memberships", ["user_id", "partner_id"], :name => "index_partner_memberships_on_user_id_and_partner_id", :unique => true

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "intro_text"
    t.string   "plan_tier",             :default => "freemium", :null => false
    t.integer  "rating_system_id"
    t.integer  "idea_rating_system_id"
  end

  add_index "partners", ["idea_rating_system_id"], :name => "index_partners_on_idea_rating_system_id"
  add_index "partners", ["plan_tier"], :name => "index_partners_on_plan_tier"
  add_index "partners", ["rating_system_id"], :name => "index_partners_on_rating_system_id"

  create_table "preferences", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "owner_id",   :null => false
    t.string   "owner_type", :null => false
    t.integer  "group_id"
    t.string   "group_type"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preferences", ["owner_id", "owner_type", "name", "group_id", "group_type"], :name => "index_preferences_on_owner_and_name_and_preference", :unique => true

  create_table "previous_ratings", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.integer  "rating_system_id", :null => false
    t.integer  "score",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rateable_id",      :null => false
    t.string   "rateable_type",    :null => false
  end

  add_index "previous_ratings", ["rateable_id", "rateable_type"], :name => "index_previous_ratings_on_rateable_id_and_rateable_type"
  add_index "previous_ratings", ["rating_system_id"], :name => "index_previous_ratings_on_rating_system_id"
  add_index "previous_ratings", ["user_id"], :name => "index_previous_ratings_on_user_id"

  create_table "rating_systems", :force => true do |t|
    t.integer  "minimum_score", :null => false
    t.integer  "maximum_score", :null => false
    t.string   "name",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "score",            :null => false
    t.integer  "user_id",          :null => false
    t.integer  "rating_system_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rateable_id",      :null => false
    t.string   "rateable_type",    :null => false
  end

  add_index "ratings", ["rateable_id", "rateable_type"], :name => "index_ratings_on_rateable_id_and_rateable_type"
  add_index "ratings", ["rating_system_id"], :name => "index_ratings_on_rating_system_id"
  add_index "ratings", ["user_id", "rateable_id", "rateable_type"], :name => "index_ratings_on_user_id_and_rateable_id_and_rateable_type", :unique => true
  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "topics", :force => true do |t|
    t.string   "title",                               :null => false
    t.text     "description",                         :null => false
    t.integer  "partner_id",                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "closed_at"
    t.string   "external_id"
    t.integer  "ratings_count",        :default => 0, :null => false
    t.float    "average_rating_score"
  end

  add_index "topics", ["closed_at"], :name => "index_topics_on_closed_at"
  add_index "topics", ["external_id"], :name => "index_topics_on_external_id"
  add_index "topics", ["partner_id"], :name => "index_topics_on_partner_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",     :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",     :null => false
    t.string   "login",                                                     :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                  :default => "user"
    t.string   "external_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["external_id"], :name => "index_users_on_external_id"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
