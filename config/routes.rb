Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'posts#index'
  get 'index', to: 'posts#index'
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post'posts', to: 'posts#create'
end
