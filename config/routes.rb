# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'products#index'
  resources :products, only: %i[index show]

  namespace :admin do
    resources :items
  end
end
