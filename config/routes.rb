Rails.application.routes.draw do
  resources :tests
  resources :prescriptions
  resources :records
  devise_for :users
  root to: 'records#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "search", to: "records#search", as: "search"
  get "business", to: "records#business", as: "business"
end
