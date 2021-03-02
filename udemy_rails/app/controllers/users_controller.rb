class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user]) #flash[:user]を用いることでユーザー名が残る
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_to :back, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
    # binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)

  end
end
