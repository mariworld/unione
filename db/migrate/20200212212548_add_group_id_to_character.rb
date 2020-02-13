class AddGroupIdToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :group_id, :integer
  end
end
