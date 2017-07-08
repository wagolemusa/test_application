class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy] # it rectrite user to edit or update others user'accounts
	before_action :require_admin, only: [:destroy] #it unables admin to  delete userss

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
		session[:user_id] = @user.id  # signup fuctions for users 
		flash[:success] = "Welcome to the alpha blog #{@user.username}"
		redirect_to user_path(@user)
	else
		render 'new'
	end	
end

def edit
	#@user = User.find(params[:id])
	
end
def update
	#@user = User.find(params[:id])
	if @user.update(user_params)
		flash[:success] = "Your account was update successfully"
		redirect_to articles_path
	else
		render 'edit'

	end
end

def show
	#@user  = User.find(params[:id])
	#this adds paginate pages to user's show page
	@user_articles = @user.articles.paginate(page: params[:page], per_page: 5) 	
end

def destroy  #this function will heilp admin to delete a user
	@user = User.find(params[:id])
	@user.destroy
	flash[:danger] = "User and all articles created by user have been delete"
	redirect_to users_path	
end


private

def user_params
	params.require(:user).permit(:username, :email, :password)
	
end

def set_user
	@user  = User.find(params[:id])
end

def require_same_user
	#if current_user != @user
	if current_user != @user and !current_user.admin?  #it unable admin to delete users 
		flash[:danger] = "You can only edit your own account"
		redirect_to root_path
	end
end

def require_admin # unable admi  to delete users
	if logged_in? and !current_user.admin?
		flash[:danger] = "only admin can perform that action"
		redirect_to root_path
	end
end

end