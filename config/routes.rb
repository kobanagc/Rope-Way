Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users
  post "users/reactions/:id" => "reactions#create"
  post "users/likes/:id/destroy" => "likes#destroy"
  resources :matchings
  resources :rooms do
    resources :messages
  end

end
