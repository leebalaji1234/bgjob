require 'test_helper'

class AuthenticatesTempsControllerTest < ActionController::TestCase
  setup do
    @authenticates_temp = authenticates_temps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authenticates_temps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authenticates_temp" do
    assert_difference('AuthenticatesTemp.count') do
      post :create, authenticates_temp: { guid: @authenticates_temp.guid, params: @authenticates_temp.params, status: @authenticates_temp.status }
    end

    assert_redirected_to authenticates_temp_path(assigns(:authenticates_temp))
  end

  test "should show authenticates_temp" do
    get :show, id: @authenticates_temp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @authenticates_temp
    assert_response :success
  end

  test "should update authenticates_temp" do
    patch :update, id: @authenticates_temp, authenticates_temp: { guid: @authenticates_temp.guid, params: @authenticates_temp.params, status: @authenticates_temp.status }
    assert_redirected_to authenticates_temp_path(assigns(:authenticates_temp))
  end

  test "should destroy authenticates_temp" do
    assert_difference('AuthenticatesTemp.count', -1) do
      delete :destroy, id: @authenticates_temp
    end

    assert_redirected_to authenticates_temps_path
  end
end
