require "test_helper"

class Public::UsesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_uses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_uses_edit_url
    assert_response :success
  end
end
