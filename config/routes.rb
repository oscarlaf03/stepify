# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :steplists do
    resources :steps, only: [:create, :new]
  end
  root to: 'steplists#index'
  resources :steps, only: [:update, :edit, :destroy, :show]
  get 'visualizations/dashboard', to: 'visualizations#dashboard', as: 'dashboard'
end
