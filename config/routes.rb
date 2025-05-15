Rails.application.routes.draw do

  # resources :comments
  # resources :posts
  # resources :records
  resources :records do
    collection do
      get :thirty_days
      get :sixty_days
    end
  end
  devise_for :users
  get "u/:username", to: "public#profile", constraints: { username: /[^\/]+/}, as: "profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "search", to: "records#search", as: "search"
  # get "business", to: "records#business", as: "business"

  get "terms", to: "records#terms", as: "terms"
  get "privacy", to: "records#privacy", as: "privacy"
  get "websiteprivacypage", to: "records#websiteprivacy", as: "websiteprivacy"
  get "home", to: "records#home", as: "home"
  get "vaccines", to: "records#vaccines", as: "vaccines"

  delete 'records/:id/picture', to: 'records#destroy_picture', as: 'picdestroy'

  get "users", to: "users#index", as:"users"
  get "business", to: "records#business", as: "business"


  resources :communities do
    resources :posts
  end



  resources :subscriptions
  resources :comments, only: [:create]
  post "post/vote", to: "votes#create"
  post "comment/votecomment", to: "votecomments#create"




  # authenticated :user do
  #   root 'records#new', as: :authenticated_poop
  # end
  # authenticated :user do
  #   root :to => 'records#routes'
  # end
  root to: 'records#home'
  # root to: 'records#home'
  get "public", to: "public#index", as: "public"
end
