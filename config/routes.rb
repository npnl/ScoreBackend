Rails.application.routes.draw do

  root 'home#index'
  post 'login' => 'sessions#create'
  post 'signup' => 'users#create'
  resources :users
  resources :subjects
  resources :groups
  resources :nihss_form
end
