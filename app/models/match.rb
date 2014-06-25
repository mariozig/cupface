class Match < ActiveRecord::Base
  belongs_to :home_team, foreign_key: 'home_team_id', class_name: 'Team'
  belongs_to :away_team, foreign_key: 'away_team_id', class_name: 'Team'

  default_scope { order(:start_time) }

  def winning_team
    home_score > away_score ? home_team : away_team
  end
end
