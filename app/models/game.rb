#:nodoc:
class Game < ActiveRecord::Base
  has_many :guesses # TODO: destroy guesses when game destroyed

  TOTAL_LIVES = 10

  def letters
    guesses.pluck(:letter)
  end

  def game_over?
    lost? || won?
  end

  def lives_remaining
    TOTAL_LIVES - (letters - word.chars).size
  end

  def masked_word
    word.chars.map { |x| x if letters.include? x }
  end

  def won?
    (word.chars - letters).size.zero?
  end

  def lost?
    lives_remaining.zero?
  end
end
