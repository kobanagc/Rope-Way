Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users
  post "users/likes/:id/create" => "likes#create"
  post "users/likes/:id/destroy" => "likes#destroy"
end
