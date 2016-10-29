Rails.application.routes.draw do
  resources :walmart_items, 	 	only: [:index, :show]
end
