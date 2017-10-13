#:nodoc:
module GamesHelper
  def masked_word(masked_letters)
    masked_letters.map { |x| x ? x : '_' }.join(' ')
  end

  def guessed_letters
    @game.guessed_letters.join
  end

  def lives_remaining
    @game.lives_remaining
  end

  def game_running?
    !@game.game_over?
  end
end
