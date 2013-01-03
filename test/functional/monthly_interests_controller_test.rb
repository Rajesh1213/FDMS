require 'test_helper'

class MonthlyInterestsControllerTest < ActionController::TestCase
  setup do
    @monthly_interest = monthly_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_interest" do
    assert_difference('MonthlyInterest.count') do
      post :create, monthly_interest: { customer_id: @monthly_interest.customer_id, date_of_issue: @monthly_interest.date_of_issue, due_closing_date: @monthly_interest.due_closing_date, interest_per_day: @monthly_interest.interest_per_day, loan_amount: @monthly_interest.loan_amount, loan_name: @monthly_interest.loan_name, payment_days: @monthly_interest.payment_days, total_interest: @monthly_interest.total_interest, total_paid: @monthly_interest.total_paid, user_id: @monthly_interest.user_id }
    end

    assert_redirected_to monthly_interest_path(assigns(:monthly_interest))
  end

  test "should show monthly_interest" do
    get :show, id: @monthly_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_interest
    assert_response :success
  end

  test "should update monthly_interest" do
    put :update, id: @monthly_interest, monthly_interest: { customer_id: @monthly_interest.customer_id, date_of_issue: @monthly_interest.date_of_issue, due_closing_date: @monthly_interest.due_closing_date, interest_per_day: @monthly_interest.interest_per_day, loan_amount: @monthly_interest.loan_amount, loan_name: @monthly_interest.loan_name, payment_days: @monthly_interest.payment_days, total_interest: @monthly_interest.total_interest, total_paid: @monthly_interest.total_paid, user_id: @monthly_interest.user_id }
    assert_redirected_to monthly_interest_path(assigns(:monthly_interest))
  end

  test "should destroy monthly_interest" do
    assert_difference('MonthlyInterest.count', -1) do
      delete :destroy, id: @monthly_interest
    end

    assert_redirected_to monthly_interests_path
  end
end
