Rails.application.routes.draw do
  resources :walmart_products, 	 	only: [:new, :index, :show]
end
