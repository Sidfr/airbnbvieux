Rails.application.routes.draw do

  devise_for :users,
     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

resources :services, only: [:show, :index]

  namespace :account do
    resource :profile, controller: 'profile'
    resources :reviews, only: [:index, :new, :create]
    resources :services
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
