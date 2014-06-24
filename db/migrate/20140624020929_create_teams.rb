class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo
      t.string :website
      t.integer :founded_year
      t.string :address
      t.string :home_stadium
      t.integer :stadium_capacity
      t.string :group
      t.integer :group_rank
      t.integer :group_points
      t.integer :matches_played
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.integer :goals_for
      t.integer :goals_against
      t.integer :goals_diff
      t.string :kimono_id

      t.timestamps
    end
  end
end
