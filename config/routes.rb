Rails.application.routes.draw do
  devise_for :customers
  root to: 'bikes#index'

  resources :advertisements, only: [:show] do
    resources :bikes, only: [:show]
    resources :rents, only: [:new, :create, :show]
  end
end
