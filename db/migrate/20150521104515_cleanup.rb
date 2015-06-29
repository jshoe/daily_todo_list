class Cleanup < ActiveRecord::Migration
  def change
    remove_column :entries, :parent_id
  end
end
