require 'test_helper'

class SteplistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get steplists_new_url
    assert_response :success
  end

  test "should get edit" do
    get steplists_edit_url
    assert_response :success
  end

  test "should get index" do
    get steplists_index_url
    assert_response :success
  end

  test "should get show" do
    get steplists_show_url
    assert_response :success
  end

end
