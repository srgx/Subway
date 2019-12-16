class AuthorsController < ApplicationController
  def index
    @authors=Author.all
  end

  def show
    @author=Author.find(params[:id])
    @books=@author.books
  end

  def new
    @author = Author.new
  end

  def create
    # render plain: params[:author].inspect
    @author=Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def destroy
    @author=Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:name)
    end
end
