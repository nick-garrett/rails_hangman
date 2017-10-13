# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GuessesController, type: :controller do
  fixtures :games
  fixtures :guesses

  describe 'POST #create' do
    let(:guess) { 'a' }
    let(:game) { games(:won_game) }

    before do
      post :create, game_id: game.id, guess: { letter: guess }
    end

    context 'when a valid game_id and valid guess is posted' do
      let(:guess) { 'a' }
      let(:game) { games(:won_game) }

      it 'redirects to game' do
        expect(response).to redirect_to(game)
      end

      it 'has no errors' do
        expect(flash[:error]).to be_nil
      end
    end

    context 'when a valid game_id and an invalid guess is posted' do
      let(:guess) { '!' }
      let(:game) { games(:won_game) }

      it 'redirects to game' do
        expect(response).to redirect_to(game)
      end

      it 'has errors' do
        expect(flash[:error]).not_to be_nil
      end
    end
  end
end
