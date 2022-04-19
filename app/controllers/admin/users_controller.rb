class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find[params[:id]]  
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)

    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザーを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user = user.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザーを削除しました。"
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
