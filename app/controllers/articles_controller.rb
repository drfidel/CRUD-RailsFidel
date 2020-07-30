class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
    end
    
    def def new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
          flash[:success] = "Article successfully created"
          redirect_to @article
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
    
    
    
end
