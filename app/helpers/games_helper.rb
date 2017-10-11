module GamesHelper
  def start_button
    button_to('Start Game', '/games', autofocus: true)
  end

  def masked_word
    @game.masked_word.map { |x| x ? x : '_' }.join(' ')
  end

  def guessed_letters
    @game.letters.join
  end

  def lives_remaining
    @game.lives_remaining
  end

  def game_running?
    !@game.game_over?
  end

  def new_game_button
    button_to('New Game', '/games', autofocus: true) 
  end
end
