Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  root 'welcome#index'
end
