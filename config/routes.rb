Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "walmart_products#index"
  resources :walmart_products, 	 	only: [:new, :index, :show] do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end
