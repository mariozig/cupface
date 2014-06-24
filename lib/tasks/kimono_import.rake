namespace :kimono_import do
  desc "Import all team ids"
  task team_ids: :environment do
    teams_response = RestClient.get "http://worldcup.kimonolabs.com/api/teams?apikey=#{Figaro.env.kimono_api_key}"
    JSON.parse(teams_response).each { |team| Team.create!(kimono_id: team['id']) }
  end

  desc "Import all team data"
  task team_data: :environment do
    Team.all.each do |team|
      url = "http://worldcup.kimonolabs.com/api/teams/#{team.kimono_id}?apikey=#{Figaro.env.kimono_api_key}"
      puts "Looking up: #{url}"

      team_response = RestClient.get(url)
      team_data = JSON.parse(team_response)

      team.name = team_data['name']
      team.logo = team_data['logo']
      team.website = team_data['website']
      team.website = team_data['website']
      team.founded_year = team_data['foundedYear']
      team.address = team_data['address']
      team.home_stadium = team_data['homeStadium']
      team.stadium_capacity = team_data['stadiumCapacity']
      team.group = team_data['group']
      team.group_rank = team_data['groupRank']
      team.group_points = team_data['groupPoints']
      team.matches_played = team_data['matchesPlayed']
      team.wins = team_data['wins']
      team.losses = team_data['losses']
      team.draws = team_data['draws']
      team.goals_for = team_data['goalsFor']
      team.goals_against = team_data['goalsAgainst']
      team.goals_diff = team_data['goalsDiff']

      team.save!
    end
  end

end
