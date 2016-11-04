Rails.application.routes.draw do
  resources :walmart_products, 	 	only: [:index, :show]
end
