Rails.application.routes.draw do
  root to: 'bikes#index'

  resources :advertisements, only: [:show] do
    resources :bikes, only: [:show]
    resources :rents, only: [:new, :create]
  end
end
