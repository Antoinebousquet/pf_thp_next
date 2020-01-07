Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :patients
  devise_for :practionners
  resources :patients do
    resources :avatars, only: [:create]
  end
  resources :patient_list
  resources :doctor_appointment_list
  resources :practionners do
    resources :avatars, only: [:create]
  end

end
