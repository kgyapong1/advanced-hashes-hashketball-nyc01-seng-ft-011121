
def num_points_scored(player_name)
  points = []
  game_hash.each do |location, team_data|
    team_data.each do |key, data|
      if key == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            points << data_item[:points]
          end
        end
      end
    end
  end
  return points[0]
end

def shoe_size(player_name)
  shoe_size = []
  game_hash.each do |location, team_data|
    team_data.each do |key, data|
      if key == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            shoe_size << data_item[:shoe]
          end
        end
      end
    end
  end
  return shoe_size[0]
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_names << team_data[:team_name]
  end
  return team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |data_item|
        jersey_numbers << data_item[:number]
      end
    end
  end
  return jersey_numbers
end

def player_stats(player_name)
  player_stats = {}
 
  game_hash.map {|team, team_hash|
    team_hash.map {|attribute, data|
      if attribute == :players
        data.map {|player_hash|
          if player_hash[:player_name] == player_name
            player_stats = player_hash
          end
        }
      end
    }
  }
 
  player_stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |data_item|
      if data_item[:shoe] > shoe_size
        shoe_size = data_item[:shoe]
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data[:players].each do |data_item|
      if data_item[:shoe] == shoe_size
        rebounds = data_item[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  most_points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |data_item|
      if data_item[:points] > most_points
        most_points = data_item[:points]
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data[:players].each do |data_item|
      if data_item[:points] == most_points
        return data_item[:player_name]
      end
    end
  end
end

def winning_team
  team_one = 0
  team_two = 0
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      team_data[:players].each do |data_item|
        team_one = team_one + data_item[:points]
      end
    else
      team_data[:players].each do |data_item|
        team_two = team_two + data_item[:points]
      end
    end
  end
  team_one > team_two ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data_item|
      if data_item[:player_name].length > longest_name.length
        longest_name = data_item[:player_name]
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  steals = 0
  player_with_most_steals = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data_item|
      if data_item[:steals] > steals
        steals = data_item[:steals]
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data[:players].each do |data_item|
      if data_item[:steals] == steals
        player_with_most_steals = data_item[:player_name]
      end
    end
  end
  player_with_most_steals == player_with_longest_name
end