Rails.application.routes.draw do
  resources :games, only: %i[index create show] do
    resources :guesses, only: [:create]
  end
  root 'games#index'
end
