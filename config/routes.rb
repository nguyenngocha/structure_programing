Rails.application.routes.draw do
  root "static_pages#home"

  namespace :admin do
    root controller: :static_pages, action: :home, as: :root
    resources :cities, except: :show
    resources :towns, except: :show
    resources :users
    resources :product_types
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
end
