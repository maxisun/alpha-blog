class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    # debugger => detendra el servicio y podes inspecciona a mas a fondo lo que esta pasando en este metodo
    @article = Article.new(article_params)
    @article.user = User.first #quitar despues
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: ArticlesDatatable.new(view_context) }
     end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def pages 
      params.permit(:page, :page_size)
    end

end