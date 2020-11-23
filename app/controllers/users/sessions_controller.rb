class Users::SessionsController < Devise::SessionsController

  def new_guest
    user = User.guest
    sign_in user
    notice: 'ゲストユーザーとしてログインしました。'
    'http://localhost:3000/index'
  end

  
end
