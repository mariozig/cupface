class ChangeGameMinuteToString < ActiveRecord::Migration
  def up
    change_column :faces, :game_minute, :string
  end

  def down
    change_column :faces, :game_minute, :integer
  end
end
