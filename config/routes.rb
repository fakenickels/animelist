Rails.application.routes.draw do
  devise_for :users 
  resources :animes
  resources :watched_animes
  root 'animes#index'
end
