Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  namespace :admin do
    resources :users
  end
  
  root to: 'questions#index'
  resources :questions
end
