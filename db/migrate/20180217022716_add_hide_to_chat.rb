class AddHideToChat < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :hide, :boolean
  end
end
