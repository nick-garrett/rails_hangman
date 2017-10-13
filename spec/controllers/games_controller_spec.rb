# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  # pending "add some examples to (or delete) #{__FILE__}"
  fixtures 'words'
  fixtures 'games'

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'redirects to show action' do
      post :create
      expect(response).to redirect_to(assigns[:game])
    end

    it 'creates a new game object' do
      post :create
      expect(assigns[:game]).not_to be_nil
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, id: 1
      expect(response).to have_http_status(:success)
    end

    it 'sets game object' do
      get :show, id: 1
      expect(assigns[:game]).not_to be_nil
    end

    it 'renders the show template' do
      get :show, id: 1
      expect(response).to render_template(:show)
    end

    context 'when requested game id does not exist' do
      it 'should redirect to #index' do
        get :show, id: 10000
        expect(response).to redirect_to(:index)
      end
    end
  end
end
