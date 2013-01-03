require 'test_helper'

class RentsTransactionsControllerTest < ActionController::TestCase
  setup do
    @rents_transaction = rents_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rents_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rents_transaction" do
    assert_difference('RentsTransaction.count') do
      post :create, rents_transaction: { bal_amount: @rents_transaction.bal_amount, collected_by: @rents_transaction.collected_by, due_date: @rents_transaction.due_date, month: @rents_transaction.month, next_due_date: @rents_transaction.next_due_date, paid_amount: @rents_transaction.paid_amount, paid_date: @rents_transaction.paid_date, rent_amount: @rents_transaction.rent_amount, rent_id: @rents_transaction.rent_id }
    end

    assert_redirected_to rents_transaction_path(assigns(:rents_transaction))
  end

  test "should show rents_transaction" do
    get :show, id: @rents_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rents_transaction
    assert_response :success
  end

  test "should update rents_transaction" do
    put :update, id: @rents_transaction, rents_transaction: { bal_amount: @rents_transaction.bal_amount, collected_by: @rents_transaction.collected_by, due_date: @rents_transaction.due_date, month: @rents_transaction.month, next_due_date: @rents_transaction.next_due_date, paid_amount: @rents_transaction.paid_amount, paid_date: @rents_transaction.paid_date, rent_amount: @rents_transaction.rent_amount, rent_id: @rents_transaction.rent_id }
    assert_redirected_to rents_transaction_path(assigns(:rents_transaction))
  end

  test "should destroy rents_transaction" do
    assert_difference('RentsTransaction.count', -1) do
      delete :destroy, id: @rents_transaction
    end

    assert_redirected_to rents_transactions_path
  end
end
