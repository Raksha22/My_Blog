class ArticlesController < ApplicationController
    
    # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    def index
      # @articles = Article.all
      #@articles = Article.search(params[:search])
      @articles = Article.paginate(page: params[:page], per_page: 5).order("created_at DESC")
    end
   
    def show
      @article = Article.find(params[:id])
    end
    
    # def self.search 
    #   # @article = Article.where("title LIKE ? OR text LIKE ?", "%#{params[:search]}%")

    #   if params[:search].blank?  
    #     redirect_to(articles_path, alert: "Empty field!") and return  
    #   else  
    #     @parameter = params[:search] 
    #     @results = Article.all.where("lower(title) LIKE :search", search: @parameter)  
    #   end   
    # end
   
    def new
      @article = Article.new

    end
   
    def edit
      @article = Article.find(params[:id])
    end
   
    def create
      @article = Article.new(article_params)
   
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end
   
    def update
      @article = Article.find(params[:id])
   
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
   
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      # redirect_to articles_path
      respond_to do |format|
        
        format.html { respond_to article_params, notice: 'Article was successfully remove '}
        format.json { head :no_content }
        format.js
      end
    end
   
    private
      def article_params
        params.require(:article).permit(:title, :text, :password)
      end
  end