require "test_helper"

class CompaniesTest < ActionDispatch::IntegrationTest
  test "companies index displays company names" do
    # Create test data
    Company.create(name: "Google")
    Company.create(name: "Apple")

    # Visit the companies index page
    get "/companies"

    # Verify the response is successful
    assert_response :success

    # Verify company names appear on the page
    assert_select "li", text: "Google"
    assert_select "li", text: "Apple"
  end
end