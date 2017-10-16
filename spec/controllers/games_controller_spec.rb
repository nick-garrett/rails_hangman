require 'rails_helper'

RSpec.describe GamesController, type: :controller do
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
    before do
      get :show, id: id
    end

    let(:id) { 1 }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    context 'when requested game id does exist' do
      it 'sets game object' do
        expect(assigns[:game].id).to eq id
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end
  end
end
