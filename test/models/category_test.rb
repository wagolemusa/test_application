require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	def setup # this was set up as test every time u run up your test, it will first run this test
		@category = Category.new(name: "sports")
	end

	test "category should be valid" do 
		assert @category.valid?
	end 

	test "name should be present" do  # validation for cotegories 
		@category.name = ""
		assert_not @category.valid?
	end

	test "name should be unique" do 
		@category.save
		category2 = Category.new(name: "sports")
		assert_not category2.valid?
	end

	test "name should be not too long" do 
		@category.name = "a" * 26
		assert_not @category.valid?
	end

	test "name should be not too short" do
		@category.name = "aa" 
		assert_not @category.valid?
	end

end