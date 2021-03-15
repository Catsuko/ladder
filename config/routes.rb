Rails.application.routes.draw do

  resources :players
  resources :games do
    resources :titles
  end

  root 'players#index'
end
