class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "parent_id"
      t.decimal  "num_val"
      t.string   "text_val"
      t.text     "notes"
    end
  end
end
