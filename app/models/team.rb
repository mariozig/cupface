class Team < ActiveRecord::Base
  has_many :players
  has_many :home_matches, foreign_key: 'home_team_id', class_name: 'Match'
  has_many :away_matches, foreign_key: 'away_team_id', class_name: 'Match'

  default_scope { order(:name) }

  def matches
    home_matches + away_matches
  end
end
