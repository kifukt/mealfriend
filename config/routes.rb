Rails.application.routes.draw do
  root to: 'static#index'
  



  resources :intakes
  resources :ingredients
  resources :diaries
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
