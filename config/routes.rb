Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/consulta_marcada", to: "pages#confirmation", as: :confirmation

  get "/admin", to: "users#show", as: :user_profile

  get "/admin/doctors/new", to: "doctors#new", as: :new_doctor
  post "/admin/doctors", to: "doctors#create", as: :doctors
  get "/admin/doctors/:id/edit", to: "doctors#edit", as: :edit_doctor
  patch "/admin/doctors/:id", to: "doctors#update", as: :doctor
  put "/admin/doctors/:id", to: "doctors#update"
  delete "/admin/doctors/:id", to: "doctors#destroy"

  get "/admin/doctors/:doctor_id/specialties/new", to: "specialties#new", as: :new_specialty
  post "/admin/doctors/:doctor_id/specialties", to: "specialties#create", as: :specialties
  get "/admin/doctors/:doctor_id/specialties/:id/edit", to: "specialties#edit", as: :edit_specialty
  patch "/admin/doctors/:doctor_id/specialties/:id", to: "specialties#update", as: :specialty
  put "/admin/doctors/:doctor_id/specialties/:id", to: "specialties#update"
  delete "/admin/doctors/:doctor_id/specialties/:id", to: "specialties#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
end
