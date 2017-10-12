# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  fixtures :games
  fixtures :guesses

  let(:word) { 'word' }

  describe '#guessed_letters' do
    context 'when no letters are guessed' do
      let(:game) { games(:no_guess_game) }

      it 'should return an empty array' do
        expect(game.guessed_letters).to be_empty
      end
    end

    context 'when some letters are guessed' do
      let(:game) { games(:word_guessed_game) }

      it 'should return a non empty array' do
        expect(game.guessed_letters).not_to be_empty
      end

      it 'should return the correct letters in the array' do
        expect(game.guessed_letters).to eq %w[w o r d]
      end
    end
  end

  describe '#won?' do
    context 'when all of the word letters are guessed' do
      let(:game) { games(:won_game) }

      it 'is won' do
        expect(game).to be_won
      end
    end

    context 'when none of the letters are guessed' do
      let(:game) { games(:not_won_game) }

      it 'is not won' do
        expect(game).not_to be_won
      end
    end
  end

  describe '#lost?' do
    context 'when lives_remaining is zero' do
      let(:game) { games(:lost_game) }

      it 'is lost' do
        expect(game).to be_lost
      end
    end

    context 'when lives_remaining is > 0' do
      let(:game) { games(:not_lost_game) }

      it 'is not lost' do
        expect(game).not_to be_lost
      end
    end
  end

  describe '#lives_remaining' do
    # pending 'lives_remaining tests'
    context 'when number of incorrect guesses is the same as total lives' do
      let(:game) { games(:zero_lives_game) }

      it 'returns 0' do
        expect(game.lives_remaining).to eq 0
      end
    end

    context 'when number of incorrect guesses is the less than as total lives' do
      let(:game) { games(:nine_lives_game) }

      it 'returns greater than zero' do
        expect(game.lives_remaining).to be > 0
      end
    end
  end

  describe '#masked_word' do
    context 'when all of the word is guessed' do
      let(:game) { games(:won_game) }

      it 'returns the letters of the word' do
        expect(game.masked_word).to eq word.chars
      end
    end

    context 'when some of the word is guessed' do
      let(:game) { games(:first_letter_guessed_game) }

      it 'returns a nil array with the guessed letters from the word inserted' do
        expect(game.masked_word).to eq [word.chars.first, nil, nil, nil]
      end
    end

    context 'when only wrong letters are guessed' do
      let(:game) { games(:lost_game) }

      it 'returns a nil array' do
        expect(game.masked_word).to eq [nil, nil, nil, nil]
      end
    end
  end
end
