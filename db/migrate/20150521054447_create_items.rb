class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string   "title"
      t.integer  "user_id"
      t.text     "notes"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.text     "tags"
    end
  end
end
