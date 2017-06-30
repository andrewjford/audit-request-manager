Rails.application.routes.draw do
  resources :projects
  resources :organizations
  devise_for :users
  
  root 'welcome#index'
end
