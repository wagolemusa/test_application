class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]


	def index
		
		#@articles = Article.all
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

def new

	@article = Article.new
	
end

def edit
	#@article = Article.find(params[:id])
	
end

def update
	#@article = Article.find(params[:id])

	if @article.update(article_params)

		#flash[:notice] = "Article was successfully updated"
		flash[:success] = "Article was successfully updated"

		redirect_to article_path(@article)
	else
		render 'edit'
	end
	
end

def create
	debugger
	
	@article = Article.new(article_params)
	@article.user = User.first
	if @article.save
		#flash[:notice] = "Article was successfully created"
		flash[:success] = "Article was successfully created"

		redirect_to article_path(@article)
	else
		render 'new'
	end
	
end

def show
	#@article = Article.find(params[:id])
	
end

def destroy
	#@article = Article.find(params[:id])
	@article.destroy
	#flash[:notice] = "Article was successfully deleted"
	flash[:danger] = "Article was successfully deleted"

	redirect_to articles_path
	
end

private

def set_article
	@article = Article.find(params[:id])
	
end
	def article_params
		params.require(:article).permit(:title, :description)
		
	end

end