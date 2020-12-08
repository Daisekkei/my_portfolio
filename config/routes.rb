Rails.application.routes.draw do
  root 'openings#index'
  devise_for :users
  devise_scope :user do
    post '/homes/guest_sign_in', to: 'homes#new_guest'
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :posts

  # アプリケーションを立ち上げると、瞬時に/openingsのページにアクセスされる
  root to: redirect('openings')
  
  get 'openings', to: 'openings#index'
  get 'index', to: 'posts#index'
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post'posts', to: 'posts#create'
  get 'users/edit', to: 'users#edit'

  post 'homes/guest_sign_in', to: 'posts#index'

  devise_scope :user do
    post 'homes/guest_sign_in', to: 'posts#index'
  end


end
