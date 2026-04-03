require "test_helper"

class ScannerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scanner_index_url
    assert_response :success
  end

  test "should get check" do
    get scanner_check_url
    assert_response :success
  end
end
