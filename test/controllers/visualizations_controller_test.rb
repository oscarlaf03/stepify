require 'test_helper'

class VisualizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get visualizations_dashboard_url
    assert_response :success
  end

end
