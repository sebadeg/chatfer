Rails.application.routes.draw do
  devise_for :users

  resources :chats
  resources :users

  root 'chats#index'
end
