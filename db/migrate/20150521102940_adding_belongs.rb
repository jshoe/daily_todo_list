class AddingBelongs < ActiveRecord::Migration
  def change
    remove_column :items, :user_id
    add_reference :items, :user, index: true
    add_reference :entries, :item, index: true
  end
end
