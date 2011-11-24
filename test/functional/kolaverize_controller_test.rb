require 'test_helper'

class KolaverizeControllerTest < ActionController::TestCase
  test "should get kolaverizer" do
    get :kolaverizer
    assert_response :success
  end

end
