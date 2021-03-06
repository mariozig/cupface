namespace :kimono_import do
  desc "Import/update teams"
  task teams: :environment do
    teams_data = json_for "http://worldcup.kimonolabs.com/api/teams?limit=1000&apikey=#{ENV['KIMONO_API_KEY']}"

    teams_data.each do |team_data|
      team = Team.find_or_create_by!(kimono_id: team_data['id'])

      team.name = team_data['name']
      team.logo = team_data['logo']
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

  desc "Import/update players"
  task players: :environment do
    players_data = json_for "http://worldcup.kimonolabs.com/api/players?limit=1000&apikey=#{ENV['KIMONO_API_KEY']}"

    players_data.each do |player_data|
      player = Player.find_or_create_by!(kimono_id: player_data['id'])

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

  desc "Import/update matches"
  task matches: :environment do
    matches_data = json_for "http://worldcup.kimonolabs.com/api/matches?limit=1000&apikey=#{ENV['KIMONO_API_KEY']}"

    matches_data.each do |match_data|
      match = Match.find_or_create_by!(kimono_id: match_data['id'])

      match.home_score = match_data['homeScore']
      match.away_score = match_data['awayScore']
      match.current_game_minute = match_data['currentGameMinute']
      match.start_time = match_data['startTime']
      match.status = match_data['status']
      match.venue = match_data['venue']
      match.group = match_data['group']
      match.kimono_away_team_id = match_data['awayTeamId']
      match.kimono_home_team_id = match_data['homeTeamId']

      # Associations
      match.away_team = Team.find_or_create_by(kimono_id: match.kimono_away_team_id)
      match.home_team = Team.find_or_create_by(kimono_id: match.kimono_home_team_id)

      match.save!
    end
  end

  def json_for(url)
    puts "Looking up: #{url}"

    response = RestClient.get url
    JSON.parse response
  end
end
