class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.belongs_to :user, foreign_key: true
      t.string :texto

      t.timestamps
    end
  end
end
