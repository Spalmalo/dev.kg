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

  resources :screencasts, concerns: [:impressionable, :publishable]
  resources :clips,       concerns: [:impressionable, :publishable]

  resources :asciicasts, only: [] do
    post :preview, on: :collection
  end

  resources :tags, only: [] do
    get :autocomplete_tag_name, on: :collection, path: 'autocomplete', as: :autocomplete
  end

  root to: "videos#index"

  resources :pages, path: ''
end
