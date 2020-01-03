Rails.application.routes.draw do
  resources :urls
  resources :courses
  resources :schools
  resources :organic_units
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
