# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:game) { Game.new }
  let(:word) { 'word' }

  describe '#letters' do
    # Should I actually test this???
    pending 'Not sure if this is testable, or if it should be tested'
  end

  describe '#game_over?' do
    context 'When the game is not lost' do
      before do
        allow(game).to receive(:lost?).and_return(false)
      end

      context 'when the game is won' do
        before do
          allow(game).to receive(:letters).and_return(word.chars)
          allow(game).to receive(:word).and_return(word)
        end

        it 'is game over' do
          expect(game).to be_game_over
        end
      end

      context 'when the game is not won' do
        before do
          allow(game).to receive(:guessed).and_return(word.chars)
        end

        it 'is not game over' do
          expect(game).not_to be_game_over
        end
      end
    end
  end

  describe '#lives_remaining' do
    pending 'lives_remaining tests'
  end

  describe '#masked_word' do
    pending 'masked_word tests'
  end

  describe '#end_message' do
    pending 'end_message test'
  end
end
