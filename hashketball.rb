
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
         {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
         {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
         {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
         {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
         {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
         {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
         {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
         {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
         {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end

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