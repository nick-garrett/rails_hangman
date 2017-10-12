#:nodoc:
class Word < ActiveRecord::Base
  scope :random_order, -> { order('RANDOM()') }

  def self.choose_word
    Word.random_order.first.word
  end
end
