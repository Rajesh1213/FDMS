require 'test_helper'

class MonthlyFinancesControllerTest < ActionController::TestCase
  setup do
    @monthly_finance = monthly_finances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_finances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_finance" do
    assert_difference('MonthlyFinance.count') do
      post :create, monthly_finance: { agreement_date: @monthly_finance.agreement_date, amount_recieved: @monthly_finance.amount_recieved, cleared_balance: @monthly_finance.cleared_balance, customer_id: @monthly_finance.customer_id, date_of_issue: @monthly_finance.date_of_issue, due_date: @monthly_finance.due_date, interest_percent: @monthly_finance.interest_percent, loan_name: @monthly_finance.loan_name, loan_status: @monthly_finance.loan_status, main_balance: @monthly_finance.main_balance, payment_months: @monthly_finance.payment_months, user_id: @monthly_finance.user_id }
    end

    assert_redirected_to monthly_finance_path(assigns(:monthly_finance))
  end

  test "should show monthly_finance" do
    get :show, id: @monthly_finance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_finance
    assert_response :success
  end

  test "should update monthly_finance" do
    put :update, id: @monthly_finance, monthly_finance: { agreement_date: @monthly_finance.agreement_date, amount_recieved: @monthly_finance.amount_recieved, cleared_balance: @monthly_finance.cleared_balance, customer_id: @monthly_finance.customer_id, date_of_issue: @monthly_finance.date_of_issue, due_date: @monthly_finance.due_date, interest_percent: @monthly_finance.interest_percent, loan_name: @monthly_finance.loan_name, loan_status: @monthly_finance.loan_status, main_balance: @monthly_finance.main_balance, payment_months: @monthly_finance.payment_months, user_id: @monthly_finance.user_id }
    assert_redirected_to monthly_finance_path(assigns(:monthly_finance))
  end

  test "should destroy monthly_finance" do
    assert_difference('MonthlyFinance.count', -1) do
      delete :destroy, id: @monthly_finance
    end

    assert_redirected_to monthly_finances_path
  end
end
