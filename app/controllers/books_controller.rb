class BooksController < ApplicationController
  def index
    p = params[:order]
    order = p.nil?||p=="asc" ? :asc : :desc
    @books=Book.all.order(title: order)
  end

  def show
    @book=Book.find(params[:id])
  end

  def new
    @author_name = params[:author_id].nil? ? nil : Author.find(params[:author_id]).name
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    name = author_params[:author_name]
    @author = Author.where(name: name).first

    @book.author = @author

    if @book.save
      flash[:notice] = "Book successfully created!"
      redirect_to author_path(@author)
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
      redirect_to book_path(@book)
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

    def author_params
      params.require(:book).permit(:author_name)
    end

end
