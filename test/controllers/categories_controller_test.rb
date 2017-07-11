require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase


def setup
	@category = Category.create(name: "sports") # this is a vailable for test
	@user = User.create(username: "wagole", email: "homiemusa@gmail.com", password: "password", admin: true)
end

	test "should get categories index" do 
		get :index # get is the http verb
		assert_response :success

	end

	test "should get new" do 
		session[:user_id] = @user.id
		get :new
		assert_response :success

	end

	test "should get show" do 
		#get :show
		get(:show, {'id' => @category.id}) #this id is for testing
		assert_response :success

	end

	test "should redirect create when admin not logged in" do 
		assert_no_difference 'Category.count' do 
			post :create, category: { name: "sports"}
		end
		assert_redirected_to categories_path
	end
end
