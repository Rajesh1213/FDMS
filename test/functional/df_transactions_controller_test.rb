require 'test_helper'

class DfTransactionsControllerTest < ActionController::TestCase
  setup do
    @df_transaction = df_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:df_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create df_transaction" do
    assert_difference('DfTransaction.count') do
      post :create, df_transaction: { balance: @df_transaction.balance, closing_balance: @df_transaction.closing_balance, credit: @df_transaction.credit, daily_finance: @df_transaction.daily_finance, debit: @df_transaction.debit, monthly_f_investment_id: @df_transaction.monthly_f_investment_id, opening_balance: @df_transaction.opening_balance, particulars: @df_transaction.particulars, tran_date: @df_transaction.tran_date, tran_id: @df_transaction.tran_id }
    end

    assert_redirected_to df_transaction_path(assigns(:df_transaction))
  end

  test "should show df_transaction" do
    get :show, id: @df_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @df_transaction
    assert_response :success
  end

  test "should update df_transaction" do
    put :update, id: @df_transaction, df_transaction: { balance: @df_transaction.balance, closing_balance: @df_transaction.closing_balance, credit: @df_transaction.credit, daily_finance: @df_transaction.daily_finance, debit: @df_transaction.debit, monthly_f_investment_id: @df_transaction.monthly_f_investment_id, opening_balance: @df_transaction.opening_balance, particulars: @df_transaction.particulars, tran_date: @df_transaction.tran_date, tran_id: @df_transaction.tran_id }
    assert_redirected_to df_transaction_path(assigns(:df_transaction))
  end

  test "should destroy df_transaction" do
    assert_difference('DfTransaction.count', -1) do
      delete :destroy, id: @df_transaction
    end

    assert_redirected_to df_transactions_path
  end
end
