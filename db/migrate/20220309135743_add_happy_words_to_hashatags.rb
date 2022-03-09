class AddHappyWordsToHashatags < ActiveRecord::Migration[6.1]
  def change
    add_column :hashtags, :happywords, :text, array: true, default: []
    add_column :hashtags, :sadwords, :text, array: true, default: []
  end
end
