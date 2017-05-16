require 'test_helper'

class RecruitmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruitment_index_url
    assert_response :success
  end

end
