#:nodoc:
class Game < ActiveRecord::Base
  has_many :guesses

  TOTAL_LIVES = 10

  def self.choose_word
    random_word(word_array)
    # @guesses = []
  end

  def self.random_word(words)
    words.sample.chomp
  end

  def self.word_array
    File.readlines(Rails.root + 'config/dictionary.txt')
  end

  # def initialize(word, lives = 10)
  #   @guessed = []
  #   @word = word.chars
  #   @total_lives = lives
  # end

  def validate_guess(guess)
    if letters.include? guess
      'Already guessed, try again'
    elsif guess.size > 1
      'Please only input one letter, try again'
    elsif !guess.match(/^[[:alpha:]]$/)
      'Please only input letters, try again'
    else
      false
    end
  end

  # def add_to_guessed(char)
  #   guessed.push char
  # end

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

  def end_message
    won? ? 'You won!' : 'You lost!'
  end

  private

  def won?
    (word.chars - letters).size.zero?
  end

  def lost?
    lives_remaining.zero?
  end
end
