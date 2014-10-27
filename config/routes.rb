GoogleAuthExample::Application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :albums, only: [:index, :show] do
    resources :photos, only: [:index] do
      post :add_comment, on: :member
    end
  end

  root to: "home#show"
end
