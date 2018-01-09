class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Post saved."
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:notice] = "Post successfully updated!"
      redirect_to @article
    else
      render 'edit'
    end
      
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    flash[:notice] = "Post successfully deleted!"
    redirect_to article_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
