Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
  
  root to: 'questions#index'
  post '/questions/:id/solve', to: 'questions#solve', as: 'questions_solve'
  get '/questions/unsolved', to: 'questions#unsolved', as: 'questions_unsolved'
  get '/questions/solved', to: 'questions#solved', as: 'questions_solved'
  resources :questions do
    resources :answers
  end
end
