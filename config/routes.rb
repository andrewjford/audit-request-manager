Rails.application.routes.draw do

  get '/projects/:id/status/:status_code', to: 'projects#show'

  resources :projects do
    resources :requests do
      resources :comments, only: [:new, :create, :edit, :update, :destroy, :show]
    end
  end

  resources :organizations, only: [:index]

  devise_for :users, controllers: { registrations: "registrations",
    :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users

  root 'welcome#index'
  get '/dashboard', to: 'welcome#dashboard'
  get '/organizations/audit_firms', to: 'organizations#auditors'

end
