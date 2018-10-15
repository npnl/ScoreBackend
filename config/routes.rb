Rails.application.routes.draw do

  root 'home#index'
  post 'login' => 'sessions#create'
  post 'signup' => 'users#create'
  resources :users
  resources :subjects
  resources :groups
  resources :nihss_form
  resources :fma_form
  resources :wmft_form
  resources :armtest_form
  resources :barthel_form
  resources :mmt_form
  resources :mas_form
  resources :mrs_form
  resources :sis_form
end
