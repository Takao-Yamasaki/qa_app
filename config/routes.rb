Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
  
  root to: 'questions#index'
  post '/questions/:id/solve', to: 'questions#solve', as: 'questions_solve'
  resources :questions do
    resources :answers
  end
end
