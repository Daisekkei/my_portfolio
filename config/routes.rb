Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :posts

  root to: redirect('openings')
  
  get 'openings', to: 'openings#index'
  get 'index', to: 'posts#index'
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post'posts', to: 'posts#create'

  post '/homes/guest_sign_in', to: 'posts#index#new_guest'

  devise_scope :user do
    post 'homes/guest_sign_in', to: 'posts#index#new_guest'
  end


end
