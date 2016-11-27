Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  root "static_pages#home"

  namespace :admin do
    root controller: :static_pages, action: :home, as: :root
    resources :cities, except: :show
    resources :towns, except: :show
    resources :users
    resources :product_types
    resources :products
    resources :product_colors
    resources :carts
    resources :cart_items
    get "accept_checkout" => "carts#accept_checkout"
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  get "checkout" => "carts#checkout"
  resources :products, only: :show
  resources :cart_items
  resources :carts
  resources :users
  get "checkout_info" => "carts#checkout_info"
end
