Rails.application.routes.draw do

  get     '/auth/:provider/callback', to: 'sessions#create'
  get     '/sign_in',   to: 'sessions#new'
  delete  '/sign_out',  to: 'sessions#destroy'

  concern :impressionable do
    post :like,     to: 'impressionable#like',    as: :likes
    post :dislike,  to: 'impressionable#dislike', as: :dislikes
  end

  concern :publishable do
    patch :publish
  end

  get '/screencasts',     to: redirect('/')

  resources :screencasts, concerns: [:impressionable, :publishable], except: [:index]
  resources :clips,       concerns: [:impressionable, :publishable]

  root to: "screencasts#index"

  resources :pages, only: :show, path: ''
end
