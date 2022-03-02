class AddUserToHashtag < ActiveRecord::Migration[6.1]
  def change
    add_reference :hashtags, :user, null: false, foreign_key: true
  end
end
