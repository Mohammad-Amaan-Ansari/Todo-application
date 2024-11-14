# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'tasks#index'

  # Devise routes
  devise_for :users

  # Task routes
  resources :users do
    resources :tasks do
      member do
        patch :toggle_status
        patch :toggle_priority
      end
    end
  end
end

  #   get '/users/:user_id/tasks', to: 'tasks#index', as: 'user_tasks'
  # get '/users/:user_id/tasks/new', to: 'tasks#new', as: 'new_user_task'
  # post '/users/:user_id/tasks', to: 'tasks#create'
  # get '/users/:user_id/tasks/:id', to: 'tasks#show', as: 'user_task'
  # get '/users/:user_id/tasks/:id/edit', to: 'tasks#edit', as: 'edit_user_task'
  # patch '/users/:user_id/tasks/:id', to: 'tasks#update'
  # delete '/users/:user_id/tasks/:id', to: 'tasks#destroy'
