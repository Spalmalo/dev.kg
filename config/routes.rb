Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :screencasts, only: :show do
    root to: redirect('/')
  end

  root to: "screencasts#index"

  resources :pages, only: :show, path: ''
end
