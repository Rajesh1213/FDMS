require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { account_number: @customer.account_number, address: @customer.address, customer_email: @customer.customer_email, customer_photo: @customer.customer_photo, customer_remarks: @customer.customer_remarks, director_id: @customer.director_id, first_name: @customer.first_name, is_active: @customer.is_active, last_name: @customer.last_name, loans_cleared: @customer.loans_cleared, loans_taken: @customer.loans_taken, loans_uncleared: @customer.loans_uncleared, middle_name: @customer.middle_name, partner_id: @customer.partner_id, phone1: @customer.phone1, phone2: @customer.phone2, reference_person: @customer.reference_person }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    put :update, id: @customer, customer: { account_number: @customer.account_number, address: @customer.address, customer_email: @customer.customer_email, customer_photo: @customer.customer_photo, customer_remarks: @customer.customer_remarks, director_id: @customer.director_id, first_name: @customer.first_name, is_active: @customer.is_active, last_name: @customer.last_name, loans_cleared: @customer.loans_cleared, loans_taken: @customer.loans_taken, loans_uncleared: @customer.loans_uncleared, middle_name: @customer.middle_name, partner_id: @customer.partner_id, phone1: @customer.phone1, phone2: @customer.phone2, reference_person: @customer.reference_person }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
