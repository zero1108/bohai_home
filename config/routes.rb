Rails.application.routes.draw do


  root to: 'home#index'

  # get 'news', to: 'home#news'
  # get 'teachers', to: 'home#teachers'
  # get 'courses', to: 'home#courses'

  resources :contacts, only: [:create]
  
  namespace :admin do
    resource :sessions, only: [:new, :create, :destroy]
    
    root to: 'dashboard#index'
    resources :contacts, only: [:show, :index] do
      member do
        post :deal
      end
    end
    resources :courses
    resources :teachers
    resources :news
    resources :statements
    resources :income_statements
    resources :outcome_statements
  end
end
