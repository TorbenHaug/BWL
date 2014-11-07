require 'test_helper'

class BillEntriesControllerTest < ActionController::TestCase
  setup do
    @bill_entry = bill_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_entry" do
    assert_difference('BillEntry.count') do
      post :create, bill_entry: { amount: @bill_entry.amount, unit_price: @bill_entry.unit_price }
    end

    assert_redirected_to bill_entry_path(assigns(:bill_entry))
  end

  test "should show bill_entry" do
    get :show, id: @bill_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill_entry
    assert_response :success
  end

  test "should update bill_entry" do
    patch :update, id: @bill_entry, bill_entry: { amount: @bill_entry.amount, unit_price: @bill_entry.unit_price }
    assert_redirected_to bill_entry_path(assigns(:bill_entry))
  end

  test "should destroy bill_entry" do
    assert_difference('BillEntry.count', -1) do
      delete :destroy, id: @bill_entry
    end

    assert_redirected_to bill_entries_path
  end
end
