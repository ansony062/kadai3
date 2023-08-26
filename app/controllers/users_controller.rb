class UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @book = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  def is_matching_login_user
    user =User.find(params[:id])
    unless user.id ==current_user.id
      redirect_to books_path
    end
  end
  
  
end