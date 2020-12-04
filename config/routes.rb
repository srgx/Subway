Rails.application.routes.draw do
  devise_for :users

  root 'guides#index', as: :guides

  # Models
  get 'guides/basics'
  get 'guides/migrations'
  get 'guides/validations'
  get 'guides/callbacks'
  get 'guides/associations'
  get 'guides/interface'
  get 'guides/abasics'

  # Views
  get 'guides/viewover'
  get 'guides/layrender'
  get 'guides/viewform'

  # Controllers
  get 'guides/rrout'
  get 'guides/ocontroller'

  resources :books do
    resources :comments, only: [ :create ]
  end

  resources :authors
  resources :articles

  #get 'account', to: 'accounts#show'
  resource :account

end
