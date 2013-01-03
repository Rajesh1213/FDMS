require 'test_helper'

class AddPropertiesControllerTest < ActionController::TestCase
  setup do
    @add_property = add_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_property" do
    assert_difference('AddProperty.count') do
      post :create, add_property: { Area: @add_property.Area, City: @add_property.City, Country: @add_property.Country, Pincode: @add_property.Pincode, State: @add_property.State, Street_address: @add_property.Street_address, property_type: @add_property.property_type }
    end

    assert_redirected_to add_property_path(assigns(:add_property))
  end

  test "should show add_property" do
    get :show, id: @add_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_property
    assert_response :success
  end

  test "should update add_property" do
    put :update, id: @add_property, add_property: { Area: @add_property.Area, City: @add_property.City, Country: @add_property.Country, Pincode: @add_property.Pincode, State: @add_property.State, Street_address: @add_property.Street_address, property_type: @add_property.property_type }
    assert_redirected_to add_property_path(assigns(:add_property))
  end

  test "should destroy add_property" do
    assert_difference('AddProperty.count', -1) do
      delete :destroy, id: @add_property
    end

    assert_redirected_to add_properties_path
  end
end
