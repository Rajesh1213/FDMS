require 'test_helper'

class DailyFinancesControllerTest < ActionController::TestCase
  setup do
    @daily_finance = daily_finances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_finances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_finance" do
    assert_difference('DailyFinance.count') do
      post :create, daily_finance: { agreement_date: @daily_finance.agreement_date, amount_recieved: @daily_finance.amount_recieved, cleared_balance: @daily_finance.cleared_balance, customer_id: @daily_finance.customer_id, date_of_issue: @daily_finance.date_of_issue, due_date: @daily_finance.due_date, interest_percent: @daily_finance.interest_percent, loan_amount: @daily_finance.loan_amount, loan_name: @daily_finance.loan_name, loan_status: @daily_finance.loan_status, main_balance: @daily_finance.main_balance, payment_days: @daily_finance.payment_days, string: @daily_finance.string }
    end

    assert_redirected_to daily_finance_path(assigns(:daily_finance))
  end

  test "should show daily_finance" do
    get :show, id: @daily_finance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_finance
    assert_response :success
  end

  test "should update daily_finance" do
    put :update, id: @daily_finance, daily_finance: { agreement_date: @daily_finance.agreement_date, amount_recieved: @daily_finance.amount_recieved, cleared_balance: @daily_finance.cleared_balance, customer_id: @daily_finance.customer_id, date_of_issue: @daily_finance.date_of_issue, due_date: @daily_finance.due_date, interest_percent: @daily_finance.interest_percent, loan_amount: @daily_finance.loan_amount, loan_name: @daily_finance.loan_name, loan_status: @daily_finance.loan_status, main_balance: @daily_finance.main_balance, payment_days: @daily_finance.payment_days, string: @daily_finance.string }
    assert_redirected_to daily_finance_path(assigns(:daily_finance))
  end

  test "should destroy daily_finance" do
    assert_difference('DailyFinance.count', -1) do
      delete :destroy, id: @daily_finance
    end

    assert_redirected_to daily_finances_path
  end
end
