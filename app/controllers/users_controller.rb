class UsersController < ApplicationController
  before_filter :save_login_state, only: [:new, :create]
  skip_before_filter :authenticate_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      session[:user_id] = @user.id
      redirect_to actions_path
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end