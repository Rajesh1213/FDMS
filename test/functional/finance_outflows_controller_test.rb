require 'test_helper'

class FinanceOutflowsControllerTest < ActionController::TestCase
  setup do
    @finance_outflow = finance_outflows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finance_outflows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finance_outflow" do
    assert_difference('FinanceOutflow.count') do
      post :create, finance_outflow: { amount: @finance_outflow.amount, credited_from: @finance_outflow.credited_from, income_type: @finance_outflow.income_type }
    end

    assert_redirected_to finance_outflow_path(assigns(:finance_outflow))
  end

  test "should show finance_outflow" do
    get :show, id: @finance_outflow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finance_outflow
    assert_response :success
  end

  test "should update finance_outflow" do
    put :update, id: @finance_outflow, finance_outflow: { amount: @finance_outflow.amount, credited_from: @finance_outflow.credited_from, income_type: @finance_outflow.income_type }
    assert_redirected_to finance_outflow_path(assigns(:finance_outflow))
  end

  test "should destroy finance_outflow" do
    assert_difference('FinanceOutflow.count', -1) do
      delete :destroy, id: @finance_outflow
    end

    assert_redirected_to finance_outflows_path
  end
end
