require 'test_helper'

class ArticleStructuresControllerTest < ActionController::TestCase
  setup do
    @article_structure = article_structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_structure" do
    assert_difference('ArticleStructure.count') do
      post :create, article_structure: { amount: @article_structure.amount, deleted_at: @article_structure.deleted_at }
    end

    assert_redirected_to article_structure_path(assigns(:article_structure))
  end

  test "should show article_structure" do
    get :show, id: @article_structure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article_structure
    assert_response :success
  end

  test "should update article_structure" do
    patch :update, id: @article_structure, article_structure: { amount: @article_structure.amount, deleted_at: @article_structure.deleted_at }
    assert_redirected_to article_structure_path(assigns(:article_structure))
  end

  test "should destroy article_structure" do
    assert_difference('ArticleStructure.count', -1) do
      delete :destroy, id: @article_structure
    end

    assert_redirected_to article_structures_path
  end
end
