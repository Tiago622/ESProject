Rails.application.routes.draw do
  resources :courses
  resources :disciplines
  resources :people
  resources :reservations
  resources :lessons
  resources :spaces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
