class DropBookmarksTable < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :bookmarks
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
