require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sports")
    end

    test "should be valid" do
        assert @category.valid?    
    end

    test "should not accept blank names" do
        @category.name = ""
        assert_not @category.valid?
    end

    test "should not accept names that already exist" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end

    test "should not accept names less than three characters long" do
        @category.name = "aa"
        assert_not @category.valid?
    end

    test "should not accept names more than twenty-five characters long" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "should save names as lowercase" do
        @category = Category.new(name: "Sports")
        @category.save
        category = Category.last
        assert(category.name == "sports")
    end
end