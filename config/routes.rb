Rails.application.routes.draw do
  get 'answers/new'
  get 'answers/create'
  get 'answers/destroy'
  get 'answers/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
  
  root to: 'questions#index'
  resources :questions do
    resources :answers
    resource :solve, only: [:update]
  end
end
