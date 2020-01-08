Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'authors#index'

  resources :books do
    resources :comments, only: [ :create ]
  end

  resources :authors
  resources :articles

  #get 'account', to: 'accounts#show'
  resource :account

end
