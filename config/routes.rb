Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: "walmart_products#index"

  get '/walmart_products_advanced_search' => 'walmart_products#product_advanced_search', as: 'advanced_search'

  resources :walmart_products, 	 	only: [:new, :index, :show] do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end
