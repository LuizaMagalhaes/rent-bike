Rails.application.routes.draw do
  root to: 'bikes#index'

  resources :bike, only: [:show]
  resources :advertisements, only: [:show]

end
