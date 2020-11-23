class HomesController < ApplicationController

  def index
  @post = Post.new(post_params)
 if @post.save

 end
end


  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
      # 新規ゲストユーザーを作成する際に登録する内容の記述
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
    redirect_to 'http://localhost:3000/index'
  end




end
