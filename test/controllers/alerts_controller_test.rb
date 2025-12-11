require "test_helper"

class AlertsControllerTest < ActionDispatch::IntegrationTest
  test "should get send_sms" do
    get alerts_send_sms_url
    assert_response :success
  end
end
