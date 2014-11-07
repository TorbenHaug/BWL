require 'test_helper'

class ShoppingCartEntriesControllerTest < ActionController::TestCase
  setup do
    @shopping_cart_entry = shopping_cart_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopping_cart_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopping_cart_entry" do
    assert_difference('ShoppingCartEntry.count') do
      post :create, shopping_cart_entry: { amount: @shopping_cart_entry.amount }
    end

    assert_redirected_to shopping_cart_entry_path(assigns(:shopping_cart_entry))
  end

  test "should show shopping_cart_entry" do
    get :show, id: @shopping_cart_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopping_cart_entry
    assert_response :success
  end

  test "should update shopping_cart_entry" do
    patch :update, id: @shopping_cart_entry, shopping_cart_entry: { amount: @shopping_cart_entry.amount }
    assert_redirected_to shopping_cart_entry_path(assigns(:shopping_cart_entry))
  end

  test "should destroy shopping_cart_entry" do
    assert_difference('ShoppingCartEntry.count', -1) do
      delete :destroy, id: @shopping_cart_entry
    end

    assert_redirected_to shopping_cart_entries_path
  end
end
