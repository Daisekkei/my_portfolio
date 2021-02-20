class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ProjectsHelper



# Deviseで追加したカラムを利用する機能（ユーザ登録、ログイン認証など）の場合、configure_permitted_parametersの実行が必要
before_action :configure_permitted_parameters, if: :devise_controller?
# before_action :authenticate_user!


  # サインイン後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    # flash[:notice] = "ログインに成功しました" 
    'http://localhost:3000/index' # サインイン後、このアドレスにダイレクトアクセス
  end

protected

  def configure_permitted_parameters
    #以下の:name部分は追加したカラム名に変える
    # configure_permitted_parametersが実行されると、
    # devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドを指定
    # 今回の場合、ユーザ登録(sign_up)の際、ユーザ名(name)のデータ操作が許可されることになる。ストロングパラメーター。
    # accout_updateメソッドを加えることにより、アカウントの更新の際に、データ変更が可能になる
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :image, :department, :position, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :image, :department, :position, :email, :remove_image])
    
  end



# サインアウト後のリダイレクト先をトップページへ
  def after_sign_out_path_for(resource)
    # flash[:alert] = "ログアウトしました"
    root_path
  end


end


