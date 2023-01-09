require "test_helper"

class ChildCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get child_cards_index_url
    assert_response :success
  end

  test "should get show" do
    get child_cards_show_url
    assert_response :success
  end

  test "should get edit" do
    get child_cards_edit_url
    assert_response :success
  end
end
