class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :nationality
      t.integer :age
      t.datetime :birth_date
      t.string :birth_country
      t.string :birth_city
      t.string :position
      t.string :foot
      t.string :image
      t.integer :height_cm
      t.integer :weight_kg
      t.integer :goals
      t.integer :own_goals
      t.integer :penalty_goals
      t.integer :assists
      t.string :kimono_team_id
      t.string :kimono_club_id
      t.string :kimono_id

      t.timestamps
    end
  end
end
