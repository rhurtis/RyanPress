class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to article_path(@article)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show               
        @article = Article.custom_find_by_articles(slug: params[:slug]) || render_404
    end

    def index
        @article = Article.all
    end

    def edit
        @article = Article.find_by(slug: params[:slug])
    end

    def update
        @article = Article.find_by(slug: params[:slug])

        if @article.update(article_params)
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find_by(slug: params[:slug])

        @article.destroy

        redirect_to articles_path, status: :see_other 
    end

    def slug_checker(slug)   
        # check the db if that slug exists... 
        record_check = Article.find_by(slug: slug)
    end


    def render_404
        render file: 'public/404.html', layout: false, status: :not_found
    end

    private
    def article_params
        params.require(:article).permit(:title, :body)
    end
    

end