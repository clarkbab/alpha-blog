require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

    test "get new category form, create category and show on index" do
        get new_category_path
        assert_template 'categories/new'
        assert_difference 'Category.count', 1 do
            post_via_redirect categories_path, category: {name: "sports"}
        end
        assert_template 'categories/index'
        assert_match "sports", response.body
    end

end