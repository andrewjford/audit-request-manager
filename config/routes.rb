Rails.application.routes.draw do
  resources :projects
  resources :organizations

  devise_for :users, controllers: { registrations: "registrations" }


  root 'welcome#index'
end
