require 'test_helper'

class PartnersControllerTest < ActionController::TestCase
  setup do
    @partner = partners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partner" do
    assert_difference('Partner.count') do
      post :create, partner: { address: @partner.address, email: @partner.email, first_name: @partner.first_name, last_name: @partner.last_name, m_director_id: @partner.m_director_id, phone1: @partner.phone1, phone2: @partner.phone2, photo: @partner.photo, unique_id: @partner.unique_id }
    end

    assert_redirected_to partner_path(assigns(:partner))
  end

  test "should show partner" do
    get :show, id: @partner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partner
    assert_response :success
  end

  test "should update partner" do
    put :update, id: @partner, partner: { address: @partner.address, email: @partner.email, first_name: @partner.first_name, last_name: @partner.last_name, m_director_id: @partner.m_director_id, phone1: @partner.phone1, phone2: @partner.phone2, photo: @partner.photo, unique_id: @partner.unique_id }
    assert_redirected_to partner_path(assigns(:partner))
  end

  test "should destroy partner" do
    assert_difference('Partner.count', -1) do
      delete :destroy, id: @partner
    end

    assert_redirected_to partners_path
  end
end
