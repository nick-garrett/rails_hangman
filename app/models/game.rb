class Game < ActiveRecord::Base
  has_many :guesses, dependent: :destroy

  validates_presence_of :word

  TOTAL_LIVES = 10

  def guessed_letters
    guesses.pluck(:letter)
  end

  def game_over?
    lost? || won?
  end

  def lives_remaining
    TOTAL_LIVES - (guessed_letters - word.chars).size
  end

  def masked_word
    word.chars.map { |x| x if guessed_letters.include? x }
  end

  def won?
    (word.chars - guessed_letters).empty?
  end

  def lost?
    lives_remaining.zero?
  end
end
