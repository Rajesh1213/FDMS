require 'test_helper'

class MDirectorsControllerTest < ActionController::TestCase
  setup do
    @m_director = m_directors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:m_directors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create m_director" do
    assert_difference('MDirector.count') do
      post :create, m_director: { address: @m_director.address, email: @m_director.email, first_name: @m_director.first_name, last_name: @m_director.last_name, phone1: @m_director.phone1, phone2: @m_director.phone2, photo: @m_director.photo, unique_id: @m_director.unique_id }
    end

    assert_redirected_to m_director_path(assigns(:m_director))
  end

  test "should show m_director" do
    get :show, id: @m_director
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @m_director
    assert_response :success
  end

  test "should update m_director" do
    put :update, id: @m_director, m_director: { address: @m_director.address, email: @m_director.email, first_name: @m_director.first_name, last_name: @m_director.last_name, phone1: @m_director.phone1, phone2: @m_director.phone2, photo: @m_director.photo, unique_id: @m_director.unique_id }
    assert_redirected_to m_director_path(assigns(:m_director))
  end

  test "should destroy m_director" do
    assert_difference('MDirector.count', -1) do
      delete :destroy, id: @m_director
    end

    assert_redirected_to m_directors_path
  end
end
