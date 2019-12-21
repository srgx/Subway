class BooksController < ApplicationController
  def index
    p = params[:order]
    order = p.nil?||p=="asc" ? :asc : :desc
    @author=Author.find(params[:author_id])
    @books=Book.where(author:@author).order(title: order)

  end

  def show
    @book=Book.find(params[:id])
  end

  def new
    @author=Author.find(params[:author_id])
    @book=Book.new
  end

  def create
    @author=Author.find(params[:author_id])
    @book=Book.new(book_params)
    @book.author=@author

    if @book.save
      flash[:notice] = "Book successfully created!"
      redirect_to author_books_path(@author)
    else
      render 'new'
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if(@book.update(book_params))
      flash[:notice] = "Book successfully updated!"
      redirect_to author_books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book successfully destroyed!"
    redirect_to author_books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :description)
    end
end
