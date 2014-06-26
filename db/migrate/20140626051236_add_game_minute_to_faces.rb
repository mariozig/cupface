class AddGameMinuteToFaces < ActiveRecord::Migration
  def change
    add_column :faces, :game_minute, :string
  end
end
