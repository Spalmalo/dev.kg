Rails.application.routes.draw do

  resources :screencasts, only: :show do
    root to: redirect('/')
  end

  root to: "screencasts#index"

  resources :pages, only: :show, path: ''
end
