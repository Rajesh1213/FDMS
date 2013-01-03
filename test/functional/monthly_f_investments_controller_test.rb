require 'test_helper'

class MonthlyFInvestmentsControllerTest < ActionController::TestCase
  setup do
    @monthly_f_investment = monthly_f_investments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_f_investments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_f_investment" do
    assert_difference('MonthlyFInvestment.count') do
      post :create, monthly_f_investment: { investment_amount: @monthly_f_investment.investment_amount, is_active: @monthly_f_investment.is_active, is_deleted: @monthly_f_investment.is_deleted, m_director_id: @monthly_f_investment.m_director_id, partner_id: @monthly_f_investment.partner_id }
    end

    assert_redirected_to monthly_f_investment_path(assigns(:monthly_f_investment))
  end

  test "should show monthly_f_investment" do
    get :show, id: @monthly_f_investment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_f_investment
    assert_response :success
  end

  test "should update monthly_f_investment" do
    put :update, id: @monthly_f_investment, monthly_f_investment: { investment_amount: @monthly_f_investment.investment_amount, is_active: @monthly_f_investment.is_active, is_deleted: @monthly_f_investment.is_deleted, m_director_id: @monthly_f_investment.m_director_id, partner_id: @monthly_f_investment.partner_id }
    assert_redirected_to monthly_f_investment_path(assigns(:monthly_f_investment))
  end

  test "should destroy monthly_f_investment" do
    assert_difference('MonthlyFInvestment.count', -1) do
      delete :destroy, id: @monthly_f_investment
    end

    assert_redirected_to monthly_f_investments_path
  end
end
