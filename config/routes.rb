Rails.application.routes.draw do

  resources :flags, only: :index

  get     '/auth/:provider/callback', to: 'sessions#create'
  get     '/sign_in',   to: 'sessions#new'
  delete  '/sign_out',  to: 'sessions#destroy'

  concern :impressionable do
    post :like,     to: 'impressionable#like',    as: :likes
    post :dislike,  to: 'impressionable#dislike', as: :dislikes
  end

  get '/screencasts',     to: redirect('/')

  resources :screencasts, concerns: :impressionable, except: [:index]
  resources :clips,       concerns: :impressionable

  root to: "screencasts#index"

  resources :pages, only: :show, path: ''
end
