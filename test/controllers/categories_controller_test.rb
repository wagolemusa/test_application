require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase


def setup
	@category = Category.create(name: "sports") # this is a vailable for test
end

	test "should get categories index" do 
		get :index # get is the http verb
		assert_response :success

	end

	test "should get new" do 
		get :new
		assert_response :success

	end

	test "should get show" do 
		#get :show
		get(:show, {'id' => @category.id}) #this id is for testing
		assert_response :success

	end


end
