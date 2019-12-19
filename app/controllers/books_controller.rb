class BooksController < ApplicationController
  def index
    @author=Author.find(params[:author_id])
    @books=Book.where(author:@author)
  end

  def show
    @book=Book.find(params[:id])
  end

  def new
    @author=Author.find(params[:author_id])
  end

  def create
    @author=Author.find(params[:author_id])
    @book=@author.books.create(book_params)
    redirect_to author_books_path(@author)
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to author_books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :description)
    end
end
