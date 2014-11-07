require 'test_helper'

class ArticleToTagsControllerTest < ActionController::TestCase
  setup do
    @article_to_tag = article_to_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_to_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_to_tag" do
    assert_difference('ArticleToTag.count') do
      post :create, article_to_tag: {  }
    end

    assert_redirected_to article_to_tag_path(assigns(:article_to_tag))
  end

  test "should show article_to_tag" do
    get :show, id: @article_to_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article_to_tag
    assert_response :success
  end

  test "should update article_to_tag" do
    patch :update, id: @article_to_tag, article_to_tag: {  }
    assert_redirected_to article_to_tag_path(assigns(:article_to_tag))
  end

  test "should destroy article_to_tag" do
    assert_difference('ArticleToTag.count', -1) do
      delete :destroy, id: @article_to_tag
    end

    assert_redirected_to article_to_tags_path
  end
end
