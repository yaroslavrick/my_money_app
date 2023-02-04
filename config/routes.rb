# frozen_string_literal: true

Rails.application.routes.draw do
  get 'reports/report_by_category', to: 'reports#report_by_category'
  get 'reports/report_by_dates', to: 'reports#report_by_dates'
  get 'reports/create_report_by_dates', to: 'reports#create_report_by_dates'
  get 'reports/create_report_by_category', to: 'reports#create_report_by_category'

  # get 'main/index'
  root 'main#index'
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
