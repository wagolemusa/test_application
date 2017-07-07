class WelcomeController < ApplicationController

def home
	#when a user is logged in is not surposed to go to home page
	redirect_to articles_path if logged_in?
	
end

def about
	
end


end