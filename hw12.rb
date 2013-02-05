class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)
  valid_strategies = %w(r p s)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |player|
    raise NoSuchStrategyError unless valid_strategies.include? player[1].downcase
  end
  case game[0][1].downcase
  when 'r'
    game[1][1].downcase == 'p' ? game[1] : game[0]
  when 'p'
    game[1][1].downcase == 's' ? game[1] : game[0]
  when 's'
    game[1][1].downcase == 'r' ? game[1] : game[0]
  end
end

def rps_tournament_winner(tournament)
  tournament = games(tournament).map { |game| rps_game_winner(game) } until tournament.is_final?
  rps_game_winner tournament
end

def games(tournament)
  players = [] ; games = []
  tournament.flatten.each_slice(2) { |s| players << s }
  players.each_slice(2) { |s| games << s }
  games
end

class Array
  def is_final?
    self.flatten.length == 4
  end
end
