class RemoveCharacterIdFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :character_id, :integer
  end
end
