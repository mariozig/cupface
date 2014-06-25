class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :home_score
      t.integer :away_score
      t.integer :current_game_minutes
      t.datetime :start_time
      t.string :kimono_home_team_id
      t.string :kimono_away_team_id
      t.string :status
      t.string :venue
      t.references :home_team, index: true
      t.references :away_team, index: true

      t.timestamps
    end
  end
end
