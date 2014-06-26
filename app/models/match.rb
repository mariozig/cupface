class Match < ActiveRecord::Base
  belongs_to :home_team, foreign_key: 'home_team_id', class_name: 'Team'
  belongs_to :away_team, foreign_key: 'away_team_id', class_name: 'Team'
  has_many :faces

  default_scope { order(:start_time) }

  def winning_team
    home_score > away_score ? home_team : away_team
  end

  def date
    start_time.to_date
  end

  def nice_title
    "#{date} - #{home_team.name} vs #{away_team.name}"
  end
end
