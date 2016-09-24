Rails.application.routes.draw do
  root "static_pages#home"
  
  namespace :admin do
    root "static_pages#home"
  end
  
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
end
