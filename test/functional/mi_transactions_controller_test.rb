require 'test_helper'

class MiTransactionsControllerTest < ActionController::TestCase
  setup do
    @mi_transaction = mi_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mi_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mi_transaction" do
    assert_difference('MiTransaction.count') do
      post :create, mi_transaction: { balance: @mi_transaction.balance, closing_balance: @mi_transaction.closing_balance, credit: @mi_transaction.credit, debit: @mi_transaction.debit, monthly_f_investment_id: @mi_transaction.monthly_f_investment_id, monthly_interest_id: @mi_transaction.monthly_interest_id, opening_balance: @mi_transaction.opening_balance, particulars: @mi_transaction.particulars, tran_date: @mi_transaction.tran_date, tran_id: @mi_transaction.tran_id }
    end

    assert_redirected_to mi_transaction_path(assigns(:mi_transaction))
  end

  test "should show mi_transaction" do
    get :show, id: @mi_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mi_transaction
    assert_response :success
  end

  test "should update mi_transaction" do
    put :update, id: @mi_transaction, mi_transaction: { balance: @mi_transaction.balance, closing_balance: @mi_transaction.closing_balance, credit: @mi_transaction.credit, debit: @mi_transaction.debit, monthly_f_investment_id: @mi_transaction.monthly_f_investment_id, monthly_interest_id: @mi_transaction.monthly_interest_id, opening_balance: @mi_transaction.opening_balance, particulars: @mi_transaction.particulars, tran_date: @mi_transaction.tran_date, tran_id: @mi_transaction.tran_id }
    assert_redirected_to mi_transaction_path(assigns(:mi_transaction))
  end

  test "should destroy mi_transaction" do
    assert_difference('MiTransaction.count', -1) do
      delete :destroy, id: @mi_transaction
    end

    assert_redirected_to mi_transactions_path
  end
end
