# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GuessesController, type: :controller do
  describe 'POST #create' do
    let(:guess) { 'a' }

    before do
      post :create, game_id: 1, guess: [letter: guess]
    end

    context 'when a valid game_id and valid guess is posted' do
      it 'redirects to game' do
        expect(response).to redirect_to(assigns[:game])
      end
    end
  end
end
