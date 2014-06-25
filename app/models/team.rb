class Team < ActiveRecord::Base
  has_many :players
  has_many :home_matches, foreign_key: 'home_team_id', class_name: 'Match'
  has_many :away_matches, foreign_key: 'away_team_id', class_name: 'Match'

  default_scope { order(:name) }

  def matches
    matches_table = Match.arel_table
    Match.where(
            matches_table[:home_team_id].eq(id)
            .or(matches_table[:away_team_id].eq(id))
          )
  end
end
