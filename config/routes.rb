# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'main#index'
    get 'reports/report_by_category', to: 'reports#report_by_category'
    get 'reports/report_period_by_categories', to: 'reports#report_period_by_categories'
    get 'reports/report_period_by_dates', to: 'reports#report_period_by_dates'
    get 'reports/create_report_by_dates', to: 'reports#create_report_by_dates'
    get 'reports/create_report_by_category', to: 'reports#create_report_by_category'
    resources :operations
    resources :categories
  end
end
