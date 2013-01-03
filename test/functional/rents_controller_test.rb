require 'test_helper'

class RentsControllerTest < ActionController::TestCase
  setup do
    @rent = rents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rent" do
    assert_difference('Rent.count') do
      post :create, rent: { address: @rent.address, contract_expiry_date: @rent.contract_expiry_date, contract_period: @rent.contract_period, description: @rent.description, mobile: @rent.mobile, phone: @rent.phone, reneval_contract_date: @rent.reneval_contract_date, security_doc_1: @rent.security_doc_1, security_doc_2: @rent.security_doc_2, security_doc_3: @rent.security_doc_3, security_doc_4: @rent.security_doc_4, signed_contract_date: @rent.signed_contract_date, user_id: @rent.user_id }
    end

    assert_redirected_to rent_path(assigns(:rent))
  end

  test "should show rent" do
    get :show, id: @rent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rent
    assert_response :success
  end

  test "should update rent" do
    put :update, id: @rent, rent: { address: @rent.address, contract_expiry_date: @rent.contract_expiry_date, contract_period: @rent.contract_period, description: @rent.description, mobile: @rent.mobile, phone: @rent.phone, reneval_contract_date: @rent.reneval_contract_date, security_doc_1: @rent.security_doc_1, security_doc_2: @rent.security_doc_2, security_doc_3: @rent.security_doc_3, security_doc_4: @rent.security_doc_4, signed_contract_date: @rent.signed_contract_date, user_id: @rent.user_id }
    assert_redirected_to rent_path(assigns(:rent))
  end

  test "should destroy rent" do
    assert_difference('Rent.count', -1) do
      delete :destroy, id: @rent
    end

    assert_redirected_to rents_path
  end
end
