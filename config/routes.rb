Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign_in', to: 'sessions#new'
  delete '/sign_out', to: 'sessions#destroy'

  resources :screencasts, except: [:edit, :update, :index] do
    root to: redirect('/')
  end

  resources :clips, except: [:edit, :update]

  root to: "screencasts#index"

  resources :pages, only: :show, path: ''
end
