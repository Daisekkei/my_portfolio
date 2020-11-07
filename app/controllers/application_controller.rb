class ApplicationController < ActionController::Base

def after_sign_in_path_for(resource)
  flash[:notice] = "ログインに成功しました" 
  'http://localhost:3000/index'
end

end
