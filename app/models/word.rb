#:nodoc:
class Word < ActiveRecord::Base
  scope :random_order, -> { order('RANDOM()') }

  def self.choose_word
    return nil if Word.random_order.empty?
    Word.random_order.first.word
  end
end
