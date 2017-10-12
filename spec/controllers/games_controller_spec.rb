# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  # pending "add some examples to (or delete) #{__FILE__}"
  fixtures 'words'
  
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
  end
end
