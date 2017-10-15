# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guess, type: :model do
  describe '#letter' do
    context 'when letter has invalid format' do
      let(:guess) { Guess.new }

      before do
        guess.letter = '1'
      end

      it "doesn't pass validation checks" do
        expect(guess).not_to be_valid
        expect(guess.errors[:letter]).to include 'is invalid'
      end
    end

    context 'when letter has already been guessed' do
      let(:guess) { Guess.new }

      before do
        guess_two = Guess.new
        guess_two.letter = 'a'
        guess_two.game_id = 1
        guess_two.save
        guess.letter = 'a'
        guess.game_id = 1
      end

      it "doesn't pass validation checks" do
        expect(guess).not_to be_valid
        expect(guess.errors[:letter]).to include 'has already been taken'
      end
    end

    context 'when letter has correct format and has not been guessed' do
      let(:guess) { Guess.new }

      before do
        guess.letter = 'a'
      end

      it 'passes validation checks' do
        expect(guess).to be_valid
        expect(guess.errors[:letter]).not_to include 'is invalid'
        expect(guess.errors[:letter]).not_to include 'has already been taken'
      end
    end

    context 'when capital letter is guessed' do
      let(:guess) { Guess.new }
      let(:letter) { 'A' }

      before do
        guess.letter = letter
        guess.valid?
      end
      it 'downcases before validation' do
        expect(guess.letter).to eq letter.downcase
      end
    end
  end
end
