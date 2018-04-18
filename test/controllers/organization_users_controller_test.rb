require 'test_helper'

class OrganizationUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get organization_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get organization_users_edit_url
    assert_response :success
  end

end
