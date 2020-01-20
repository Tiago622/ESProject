Rails.application.routes.draw do

  resources :roles
  devise_for :users
  resources :reservations
  resources :spaces
  resources :lesson_schedules
  resources :lessons
  resources :people
  resources :schedules
  #change root (home)
  root to: 'organic_units#index'
  
  #single resource path example:
  #get 'login', to: 'controller#action'
  
  resources :schedules
  resources :disciplines
  resources :urls
  resources :courses
  resources :schools
  resources :organic_units
  resources :spaces
  resources :spaces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
