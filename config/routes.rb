Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :songs
  resources :playlists
  resources :users
  resources :favorites
  resources :betweens
end
