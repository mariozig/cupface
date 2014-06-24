namespace :kimono_import do
  desc "Import all team ids"
  task team_ids: :environment do
    teams_response = RestClient.get "http://worldcup.kimonolabs.com/api/teams?limit=1000&apikey=#{Figaro.env.kimono_api_key}"
    JSON.parse(teams_response).each { |team| Team.create!(kimono_id: team['id']) }
  end

  desc "Import all player ids"
  task player_ids: :environment do
    players_response = RestClient.get "http://worldcup.kimonolabs.com/api/players?limit=1000&apikey=#{Figaro.env.kimono_api_key}"
    JSON.parse(players_response).each { |player| Player.create!(kimono_id: player['id']) }
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

  desc "Import all player data"
  task player_data: :environment do
    Player.all.each do |player|
      url = "http://worldcup.kimonolabs.com/api/players/#{player.kimono_id}?apikey=#{Figaro.env.kimono_api_key}"
      puts "Looking up: #{url}"

      player_response = RestClient.get(url)
      player_data = JSON.parse(player_response)

      player.first_name = player_data['firstName']
      player.last_name = player_data['lastName']
      player.nickname = player_data['nickname']
      player.nationality = player_data['nationality']
      player.age = player_data['age']
      player.birth_date = player_data['birthDate']
      player.birth_country = player_data['birthCountry']
      player.birth_city = player_data['birthCity']
      player.position = player_data['position']
      player.foot = player_data['foot']
      player.image = player_data['image']
      player.height_cm = player_data['heightCm']
      player.weight_kg = player_data['weightKg']
      player.goals = player_data['goals']
      player.own_goals = player_data['ownGoals']
      player.penalty_goals = player_data['penaltyGoals']
      player.assists = player_data['assists']
      player.kimono_team_id = player_data['teamId']
      player.kimono_club_id = player_data['clubId']
      player.kimono_id = player_data['id']

      # Associations
      player.team = Team.find_or_create_by(kimono_id: player.kimono_team_id)

      player.save!
    end
  end


end
