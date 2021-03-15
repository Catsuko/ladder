Rails.application.routes.draw do

  resources :players
  resources :games do
    resources :titles
    resources :matches
  end

  root 'players#index'
end
