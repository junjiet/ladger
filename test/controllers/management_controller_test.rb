require 'test_helper'

class ManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get members" do
    get management_members_url
    assert_response :success
  end

end
