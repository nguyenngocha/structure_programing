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
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  resources :products, only: :show
  resources :user_items
end
