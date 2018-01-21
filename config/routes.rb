Rails.application.routes.draw do
  resources :diaries
  resources :intakes
  root to: 'static#index'

  get '/feed', to: 'static#feed'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')

  resources :ingredients
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
