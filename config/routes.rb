Rails.application.routes.draw do

  root 'home#index'
  post 'login' => 'session#create'
  resources :users
end
