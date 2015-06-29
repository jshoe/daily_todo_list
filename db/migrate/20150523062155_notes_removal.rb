class NotesRemoval < ActiveRecord::Migration
  def change
    remove_column :entries, :notes
  end
end
