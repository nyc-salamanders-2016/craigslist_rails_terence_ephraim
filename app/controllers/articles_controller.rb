class ArticlesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    redirect_to category_path(@category)
  end


  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)

    if @article.save
      @link = "/categories/#{@category.id}/articles/#{@article.id}/edit?key=#{@article.link}"
      # redirect_to category_article_path(@category, @article)
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])

  end

  def edit
    @article = Article.find(params[:id])
    if params[:key] && params[:key] == @article.link
      render 'edit'
    else
      not_found
    end
  end

  def update
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :price, :email)
    end
end
