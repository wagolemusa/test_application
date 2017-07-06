class UsersController < ApplicationController

	def index
		#@users = User.all 
		@users = User.paginate(page: params[:page], per_page: 3)
	end

def new
	@user = User.new
	
end

def create
	#debugger
	@user = User.new(user_params)
	if @user.save
		flash[:success] = "Welcome to the alpha blog #{@user.username}"
		redirect_to articles_path
	else
		render 'new'
	end	
end

def edit
	@user = User.find(params[:id])
	
end
def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		flash[:success] = "Your account was update successfully"
		redirect_to articles_path
	else
		render 'edit'

	end
end

def show
	@user  = User.find(params[:id])
	#this adds paginate pages to user's show page
	@user_articles = @user.articles.paginate(page: params[:page], per_page: 5) 

	
end


private

def user_params
	params.require(:user).permit(:username, :email, :password)
	
end

end