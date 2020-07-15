Rails.application.routes.draw do
  devise_for :users

  root 'guides#index'

  get 'guides/basics'
  get 'guides/migrations'
  get 'guides/validations'
  get 'guides/callbacks'
  get 'guides/associations'
  get 'guides/interface'

  resources :books do
    resources :comments, only: [ :create ]
  end

  resources :authors
  resources :articles

  #get 'account', to: 'accounts#show'
  resource :account

end
