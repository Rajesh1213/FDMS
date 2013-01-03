require 'test_helper'

class FinanceInflowsControllerTest < ActionController::TestCase
  setup do
    @finance_inflow = finance_inflows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finance_inflows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finance_inflow" do
    assert_difference('FinanceInflow.count') do
      post :create, finance_inflow: { amount: @finance_inflow.amount, debited_from: @finance_inflow.debited_from, income_type: @finance_inflow.income_type }
    end

    assert_redirected_to finance_inflow_path(assigns(:finance_inflow))
  end

  test "should show finance_inflow" do
    get :show, id: @finance_inflow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finance_inflow
    assert_response :success
  end

  test "should update finance_inflow" do
    put :update, id: @finance_inflow, finance_inflow: { amount: @finance_inflow.amount, debited_from: @finance_inflow.debited_from, income_type: @finance_inflow.income_type }
    assert_redirected_to finance_inflow_path(assigns(:finance_inflow))
  end

  test "should destroy finance_inflow" do
    assert_difference('FinanceInflow.count', -1) do
      delete :destroy, id: @finance_inflow
    end

    assert_redirected_to finance_inflows_path
  end
end
