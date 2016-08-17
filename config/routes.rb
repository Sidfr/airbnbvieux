Rails.application.routes.draw do
  resources :services, only: [:show, :index]
  namespace :account do
    resource :profile, controller: 'profile'
    resources :reviews, only: [:index, :new, :create]
    resources :services
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
