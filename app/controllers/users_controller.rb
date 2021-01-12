class UsersController < ApplicationController

  def edit
    params.require(:user).permit(:image)
  end 
  
end
