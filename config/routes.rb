Rails.application.routes.draw do
  # resources :records
  resources :records do
    collection do
      get :thirty_days
      get :sixty_days
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "search", to: "records#search", as: "search"
  get "business", to: "records#business", as: "business"

  get "terms", to: "records#terms", as: "terms"
  get "privacy", to: "records#privacy", as: "privacy"
  get "websiteprivacypage", to: "records#websiteprivacy", as: "websiteprivacy"
  get "home", to: "records#home", as: "home"
  get "vaccines", to: "records#vaccines", as: "vaccines"

  delete 'records/:id/picture', to: 'records#destroy_picture', as: 'picdestroy'

  # root to: 'records#home'

  authenticated :user do
    root 'records#new', as: :authenticated_poop
  end
  root to: 'records#home'
end
