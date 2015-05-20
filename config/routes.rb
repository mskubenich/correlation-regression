Rails.application.routes.draw do
  root to: 'pages#index'

  match '/home', to: 'pages#index', via: [:get, :post]
  match '/group', to: 'pages#group', via: [:get, :post]
  match '/home_fixed', to: 'pages#index_fixed', via: [:get, :post]
  match '/group_fixed', to: 'pages#group_fixed', via: [:get, :post]
end
