require 'test_helper'

class OptinServicesControllerTest < ActionController::TestCase
  setup do
    @optin_service = optin_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:optin_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create optin_service" do
    assert_difference('OptinService.count') do
      post :create, optin_service: { phone: @optin_service.phone, status: @optin_service.status }
    end

    assert_redirected_to optin_service_path(assigns(:optin_service))
  end

  test "should show optin_service" do
    get :show, id: @optin_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @optin_service
    assert_response :success
  end

  test "should update optin_service" do
    patch :update, id: @optin_service, optin_service: { phone: @optin_service.phone, status: @optin_service.status }
    assert_redirected_to optin_service_path(assigns(:optin_service))
  end

  test "should destroy optin_service" do
    assert_difference('OptinService.count', -1) do
      delete :destroy, id: @optin_service
    end

    assert_redirected_to optin_services_path
  end
end
