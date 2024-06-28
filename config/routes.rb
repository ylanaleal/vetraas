Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :doctors, except: %i[index show]
  get "/admin", to: "users#show", as: :user_profile
  get "up" => "rails/health#show", as: :rails_health_check
end
