#:nodoc:
class Guess < ActiveRecord::Base
  # TODO: test if it works without the scope
  validates_uniqueness_of :letter, scope: :game_id
  validates_format_of :letter, with: /\A[a-zA-Z]+\z/

  before_validation :downcase_letter

  belongs_to :game

  def downcase_letter
    letter.downcase!
  end
end
