class AddTeamIdToPlayers < ActiveRecord::Migration
  def change
    add_reference :players, :team, index: true
  end
end
