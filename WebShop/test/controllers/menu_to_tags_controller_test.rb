require 'test_helper'

class MenuToTagsControllerTest < ActionController::TestCase
  setup do
    @menu_to_tag = menu_to_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_to_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_to_tag" do
    assert_difference('MenuToTag.count') do
      post :create, menu_to_tag: {  }
    end

    assert_redirected_to menu_to_tag_path(assigns(:menu_to_tag))
  end

  test "should show menu_to_tag" do
    get :show, id: @menu_to_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_to_tag
    assert_response :success
  end

  test "should update menu_to_tag" do
    patch :update, id: @menu_to_tag, menu_to_tag: {  }
    assert_redirected_to menu_to_tag_path(assigns(:menu_to_tag))
  end

  test "should destroy menu_to_tag" do
    assert_difference('MenuToTag.count', -1) do
      delete :destroy, id: @menu_to_tag
    end

    assert_redirected_to menu_to_tags_path
  end
end
