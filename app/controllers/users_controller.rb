class UsersController < ApplicationController
	before_action :authenticate_user!

  before_action :ensure_correct_user,
  {only: [:edit, :update]}

  def show
  	@user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
    @new_book = Book.new
    @user = current_user
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have upddated book successfully."
    redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  @book = User.find(params[:id])
  @book.destroy
  redirect_to books_path
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
      if current_user.id !=  params[:id].to_i
        redirect_to user_path(current_user)
      end
  end
end
