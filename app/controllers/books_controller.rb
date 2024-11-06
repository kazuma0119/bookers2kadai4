class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
  end
  def show
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path(@book.id)
    else
       @books=Book.all
      render :index
    end
  end
 private
 def book_params
   params.require(:book).permit(:title, :opinion)
 end
end
