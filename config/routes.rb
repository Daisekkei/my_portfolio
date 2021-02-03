Rails.application.routes.draw do
  root 'openings#index'
  devise_for :users
  devise_scope :user do
    post '/homes/guest_sign_in', to: 'homes#new_guest'
    
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :customers do
    resources :projects
  end
  
  resources :projects do
    resources :posts
  end
  

  # アプリケーションを立ち上げると、同時に/openingsのページにアクセスされる
  root to: redirect('openings')
  get 'openings', to: 'openings#index'
  get 'index', to: 'posts#index'
  get 'users/edit', to: 'users#edit'

  post 'homes/guest_sign_in', to: 'posts#index'

  devise_scope :user do
    post 'homes/guest_sign_in', to: 'posts#index'
  end


end
