class BooksController < ApplicationController
before_action :authenticate_user!


def show
	@book = Book.find(params[:id])
	@new_book = Book.new
	@user = @book.user
	@s_user = @book.title
end

def index
	@user = current_user
	@books = Book.all
	@new_book = Book.new
end

def new
	@book = Book.new
end

def create
	@new_book = Book.new(book_path_params)
	@new_book.user_id = current_user.id
	@user = current_user
	if @new_book.save
	flash[:notice] = "You have creatad book successfully."
	redirect_to book_path(@new_book.id)
else
	@books = Book.all
	render :index
end
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  	redirect_to books_path
end

def edit
	@book = Book.find(params[:id])
	if current_user.id != @book.user.id
		redirect_to books_path
	end
end

def update
	@book = Book.find(params[:id])
	if @book.update(book_path_params)
	flash[:notice] = "You have updated book successfully."
	redirect_to book_path(@book.id)
else
	render :edit
end
end

private
def book_path_params
	params.require(:book).permit(:title, :body)
end
end
