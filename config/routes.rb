Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, only: %w[], sign_out_via: %i[get delete]

  # OAuth callbacks.
  get '/auth/google_oauth2/callback', to: 'sessions#google_oauth2'
  get '/auth/facebook/callback', to: 'sessions#facebook'
  post '/auth/developer/callback', to: 'sessions#developer'

  # Session management.
  get '/sign_in_with', to: 'sessions#sign_in_with'
  get '/sign_in', to: 'sessions#sign_in_form'
  get '/sign_out', to: 'sessions#sign_out_user'

  root to: 'home#index'
end
