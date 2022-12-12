require "test_helper"

class Public::BabyfoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_babyfoods_new_url
    assert_response :success
  end

  test "should get show" do
    get public_babyfoods_show_url
    assert_response :success
  end

  test "should get index" do
    get public_babyfoods_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_babyfoods_edit_url
    assert_response :success
  end
end
