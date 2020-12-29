Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :articles
  #post "articles/new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home/contact"
end
