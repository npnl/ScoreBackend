Rails.application.routes.draw do

  root 'home#index'
  post 'login' => 'sessions#create'
  post 'signup' => 'users#create'

  get 'all_subject_info' => 'subjects#all_subject_info'
  get 'all_subject_names' => 'subjects#all_subject_names'

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
  resources :moca_form
  resources :mal_form

  get 'nihss/assessment/:id/nihss.csv' => 'nihss_form#download_data', defaults: { format: :csv }
  get 'fma/assessment/:id/fma.csv' => 'fma_form#download_data', defaults: { format: :csv }
  get 'wmft/assessment/:id/wmft.csv' => 'wmft_form#download_data', defaults: { format: :csv }
  get 'armtest/assessment/:id/armtest.csv' => 'armtest_form#download_data', defaults: { format: :csv }
  get 'barthel/assessment/:id/barthel.csv' => 'barthel_form#download_data', defaults: { format: :csv }
  get 'mmt/assessment/:id/mmt.csv' => 'mmt_form#download_data', defaults: { format: :csv }
  get 'mas/assessment/:id/mas.csv' => 'mas_form#download_data', defaults: { format: :csv }
  get 'mrs/assessment/:id/mrs.csv' => 'mrs_form#download_data', defaults: { format: :csv }
  get 'sis/assessment/:id/sis.csv' => 'sis_form#download_data', defaults: { format: :csv }
  get 'moca/assessment/:id/moca.csv' => 'moca_form#download_data', defaults: { format: :csv }
  get 'mal/assessment/:id/mal.csv' => 'mal_form#download_data', defaults: { format: :csv }

  post 'reset_password/request_token' => 'reset_password#request_token'
  post 'reset_password/update_password/:verification_token' => 'reset_password#update_password'

  delete 'destroy_assessment' => 'assessments#destroy'
  put 'update_comments' => 'assessments#update_comments'
end
