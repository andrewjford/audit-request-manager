Rails.application.routes.draw do
  resources :requests
  resources :projects
  resources :organizations

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users

  root 'welcome#index'
  get '/dashboard', to: 'welcome#dashboard'

end
