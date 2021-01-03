Rails.application.routes.draw do
  
  devise_for :users
  get "categories/indexuser"
  resources :categories
  get "articles/indexuser"
  get "articles/search" # debe ir antes del de resources, porque si entra ahí, da error ya que en resources no esta search
  resources :articles # Aqui muestra con show
  #post "articles/new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home/contact"

end
