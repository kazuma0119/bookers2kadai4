class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorites = current_user.favorites.find_by(book_id: book.id)
    favorites.destroy
    redirect_to request.referer
  end

private

 def book_params
   params.require(:book).permit(:title, :body)
 end

end
