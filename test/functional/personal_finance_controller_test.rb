require 'test_helper'

class PersonalFinanceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
