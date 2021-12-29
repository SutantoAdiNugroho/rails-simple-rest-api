# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Get all users
  get 'users', to: 'home#get_all_users'

  # Get user by id
  get 'users/:id', to: 'home#get_by_id'

  # Create user
  post 'users/create', to: 'home#post_user'
end
