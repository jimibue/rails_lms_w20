require 'test_helper'

class CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get course_index_url
    assert_response :success
  end

  test "should get show" do
    get course_show_url
    assert_response :success
  end

  test "should get new" do
    get course_new_url
    assert_response :success
  end

end
