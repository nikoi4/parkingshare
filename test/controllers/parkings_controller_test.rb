require 'test_helper'

class ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parkings_index_url
    assert_response :success
  end

  test "should get create" do
    get parkings_create_url
    assert_response :success
  end

  test "should get update" do
    get parkings_update_url
    assert_response :success
  end

  test "should get delete" do
    get parkings_delete_url
    assert_response :success
  end

end
