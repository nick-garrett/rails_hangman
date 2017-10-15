#:nodoc:
class Word < ActiveRecord::Base
  scope :random_order, -> { order('RANDOM()') }

  def self.choose_word
    rand_order = Word.random_order
    return nil if rand_order.empty?
    rand_order.first.word
  end
end
