Rails.application.routes.draw do
  resources :memberships, only: [:index, :create]
  resources :clients, only: [:index, :update, :show]
  resources :gyms, only: [:index, :show, :update, :destroy]
end
