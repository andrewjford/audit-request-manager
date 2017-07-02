Rails.application.routes.draw do

  resources :projects do
    resources :requests do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :organizations

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users

  root 'welcome#index'
  get '/dashboard', to: 'welcome#dashboard'

end
