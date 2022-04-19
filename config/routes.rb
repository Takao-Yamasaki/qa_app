Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  
  root to: 'questions#index'
  resources :questions
end
