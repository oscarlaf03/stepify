# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  devise_for :users
  resources :steplists do
    resources :steps, only: [:create, :new]
  end
  root to: 'steplists#index'
  resources :steps, only: [:update, :edit, :destroy, :show]
  resources :organizations
  get 'visualizations/dashboard', to: 'visualizations#dashboard', as: 'dashboard'
end
