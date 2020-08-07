class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    def show
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
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

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            flash[:success] = "Article successfully updated"
            redirect_to @article
          else
            flash[:error] = "Something went wrong"
            render 'edit'
          end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
    
    
    
end
