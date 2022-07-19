class ArticlesController < ApplicationController

    ARTICLES_PER_PAGE = 8

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to article_path(@article)
        else
            render :new
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def index
    

        @last_page = (Article.all.count / ARTICLES_PER_PAGE).floor
        
        #fetch finds the value of the page query parameter, if there is none supplied use 0.
        page_from_params = params.fetch(:page, 0).to_i
        
        #error handling to handle negative page/offset or when offset is greater than the last page.
        if (page_from_params > -1) and (page_from_params < @last_page + 1)
        
            @page = page_from_params
        elsif page_from_params < 0
            @page = 0

        elsif page_from_params > @last_page
            @page = @last_page
        end


        #offset is the starting point of the set of articles. 
        @article = Article.offset(@page * ARTICLES_PER_PAGE).limit(ARTICLES_PER_PAGE)

    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])

        @article.destroy

        redirect_to articles_path, status: :see_other 
    end

    private
    def article_params
        params.require(:article).permit(:title, :body)
    end
    
end