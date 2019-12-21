class AuthorsController < ApplicationController
  def index
    p = params[:order]
    order = p.nil?||p=="asc" ? :asc : :desc
    @authors=Author.order(name: order)
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
      flash[:notice] = "Author successfully created!"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
    @author=Author.find(params[:id])
  end

  def update
    @author=Author.find(params[:id])
    if(@author.update(author_params))
      flash[:notice] = "Author successfully updated!"
      redirect_to authors_path
    else
      render 'edit'
    end
  end

  def destroy
    @author=Author.find(params[:id])
    @author.destroy
    flash[:notice] = "Author successfully destroyed!"
    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:name)
    end
end
