# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories do
    resources :products, only: %i[index], controller: 'categories/products'
  end
  resources :users
  resources :banners
  resources :assets
  resources :products
end
