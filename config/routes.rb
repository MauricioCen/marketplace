# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'rails_admin/main#dashboard'
  resources :categories, only: %i[index] do
    resources :products, only: %i[index], controller: 'categories/products'
  end
  resources :banners, only: %i[index]
  resources :products, only: %i[index show]
  resources :addresses
  resources :contacts
end
