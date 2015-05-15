Rails.application.routes.draw do
  root to: 'pages#index'

  match '/home', to: 'pages#index', via: [:get, :post]
end
