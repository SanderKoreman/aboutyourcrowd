class CreateHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags do |t|
      t.string :hashtag
      t.float :score

      t.timestamps
    end
  end
end
