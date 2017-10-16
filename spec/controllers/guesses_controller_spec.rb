require 'rails_helper'

RSpec.describe GuessesController, type: :controller do
  fixtures :games
  fixtures :guesses

  describe 'POST #create' do
    let(:guess) { 'a' }
    let(:game) { games(:won_game) }

    context 'when a valid game_id and valid guess is posted' do
      let(:guess) { 'a' }
      let(:game) { games(:won_game) }

      before do
        post :create, game_id: game.id, guess: { letter: guess }
      end

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

      before do
        post :create, game_id: game.id, guess: { letter: guess }
      end

      it 'redirects to game' do
        expect(response).to redirect_to(game)
      end

      it 'has errors' do
        expect(flash[:error]).not_to be_nil
      end
    end

    context 'when an invalid game_id is posted' do
      before do
        post :create, game_id: 10_000, guess: { letter: guess }
      end

      it 'redirects to root' do
        expect(response).to redirect_to('/')
      end
    end
  end
end
