class Guess < ActiveRecord::Base
  validates_uniqueness_of :letter, scope: :game_id
  validates_format_of :letter, with: /\A[a-zA-Z]+\z/
  validates_length_of :letter, maximum: 1

  before_validation :downcase_letter

  belongs_to :game

  def downcase_letter
    letter.downcase!
  end
end
