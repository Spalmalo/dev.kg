Rails.application.routes.draw do

  devise_for :speakers

  resources :screencasts, only: :show do
    root to: redirect('/')
  end

  root to: "screencasts#index"

  resources :pages, only: :show, path: ''
end
