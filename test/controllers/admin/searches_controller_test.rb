require "test_helper"

class Admin::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get items_search" do
    get admin_searches_items_search_url
    assert_response :success
  end
end
