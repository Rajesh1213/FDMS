require 'test_helper'

class DiTransactionsControllerTest < ActionController::TestCase
  setup do
    @di_transaction = di_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:di_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create di_transaction" do
    assert_difference('DiTransaction.count') do
      post :create, di_transaction: { balance: @di_transaction.balance, closing_balance: @di_transaction.closing_balance, credit: @di_transaction.credit, dailyinterest_id: @di_transaction.dailyinterest_id, debit: @di_transaction.debit, monthly_f_investment_id: @di_transaction.monthly_f_investment_id, opening_balance: @di_transaction.opening_balance, particulars: @di_transaction.particulars, tran_date: @di_transaction.tran_date, tran_id: @di_transaction.tran_id }
    end

    assert_redirected_to di_transaction_path(assigns(:di_transaction))
  end

  test "should show di_transaction" do
    get :show, id: @di_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @di_transaction
    assert_response :success
  end

  test "should update di_transaction" do
    put :update, id: @di_transaction, di_transaction: { balance: @di_transaction.balance, closing_balance: @di_transaction.closing_balance, credit: @di_transaction.credit, dailyinterest_id: @di_transaction.dailyinterest_id, debit: @di_transaction.debit, monthly_f_investment_id: @di_transaction.monthly_f_investment_id, opening_balance: @di_transaction.opening_balance, particulars: @di_transaction.particulars, tran_date: @di_transaction.tran_date, tran_id: @di_transaction.tran_id }
    assert_redirected_to di_transaction_path(assigns(:di_transaction))
  end

  test "should destroy di_transaction" do
    assert_difference('DiTransaction.count', -1) do
      delete :destroy, id: @di_transaction
    end

    assert_redirected_to di_transactions_path
  end
end
