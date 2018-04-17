# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  devise_for :users
  resources :steplists do
    resources :steps, only: [:create, :new]
    get 'pins', to: 'pins#update_pin'
  end
  root to: 'steplists#index'
  resources :steps, only: [:update, :edit, :destroy, :show]
  resources :organizations
  get 'visualizations/dashboard', to: 'visualizations#dashboard', as: 'dashboard'
  get 'pages/test', to: 'pages#test', as: 'test'
  resources :pins , only: [:index]
  get 'my_pins', to: 'pages#my_pins'
  get 'search', to: 'pages#search'
  get 'my_lists', to: 'pages#my_lists'
  get 'account', to: 'pages#account'
end
