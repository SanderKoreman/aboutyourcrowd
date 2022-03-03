class ChangeHashtagNameToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :hashtags, :hashtag, :name
  end
end
