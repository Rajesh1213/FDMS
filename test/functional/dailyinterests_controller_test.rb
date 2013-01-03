require 'test_helper'

class DailyinterestsControllerTest < ActionController::TestCase
  setup do
    @dailyinterest = dailyinterests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailyinterests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailyinterest" do
    assert_difference('Dailyinterest.count') do
      post :create, dailyinterest: { customer_id: @dailyinterest.customer_id, date_of_issue: @dailyinterest.date_of_issue, due_closing_date: @dailyinterest.due_closing_date, interest_per_day: @dailyinterest.interest_per_day, loan_amount: @dailyinterest.loan_amount, tatal_paid: @dailyinterest.tatal_paid, total_interest: @dailyinterest.total_interest, user_id: @dailyinterest.user_id }
    end

    assert_redirected_to dailyinterest_path(assigns(:dailyinterest))
  end

  test "should show dailyinterest" do
    get :show, id: @dailyinterest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dailyinterest
    assert_response :success
  end

  test "should update dailyinterest" do
    put :update, id: @dailyinterest, dailyinterest: { customer_id: @dailyinterest.customer_id, date_of_issue: @dailyinterest.date_of_issue, due_closing_date: @dailyinterest.due_closing_date, interest_per_day: @dailyinterest.interest_per_day, loan_amount: @dailyinterest.loan_amount, tatal_paid: @dailyinterest.tatal_paid, total_interest: @dailyinterest.total_interest, user_id: @dailyinterest.user_id }
    assert_redirected_to dailyinterest_path(assigns(:dailyinterest))
  end

  test "should destroy dailyinterest" do
    assert_difference('Dailyinterest.count', -1) do
      delete :destroy, id: @dailyinterest
    end

    assert_redirected_to dailyinterests_path
  end
end
