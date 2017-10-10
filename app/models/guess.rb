#:nodoc:
class Guess < ActiveRecord::Base
  # attr_accessor :letter, :game_id
  validates :letter, uniqueness: { scope: :game_id }
  validates_format_of :letter, with: /\A[a-zA-Z]*\z/

  belongs_to :game
end
