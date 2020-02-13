class AddCharacterIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :character_id, :integer
  end
end
