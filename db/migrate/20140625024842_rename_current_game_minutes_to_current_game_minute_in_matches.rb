class RenameCurrentGameMinutesToCurrentGameMinuteInMatches < ActiveRecord::Migration
  def change
    rename_column :matches, :current_game_minutes, :current_game_minute
  end
end
