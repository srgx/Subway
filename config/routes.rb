Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'authors#index'
  #resources :books
  resources :authors do
    resources :books
  end

  get 'account', to: 'accounts#show'
end
