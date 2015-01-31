Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign_in', to: 'sessions#new'
  delete '/sign_out', to: 'sessions#destroy'

  resources :screencasts, only: [:show, :new, :create, :destroy] do
    root to: redirect('/')
  end

  resources :clips, only: [:index, :show]

  root to: "screencasts#index"

  resources :pages, only: :show, path: ''
end
