require 'test_helper'

class RequestReceiverTempsControllerTest < ActionController::TestCase
  setup do
    @request_receiver_temp = request_receiver_temps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_receiver_temps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_receiver_temp" do
    assert_difference('RequestReceiverTemp.count') do
      post :create, request_receiver_temp: { params: @request_receiver_temp.params, status: @request_receiver_temp.status }
    end

    assert_redirected_to request_receiver_temp_path(assigns(:request_receiver_temp))
  end

  test "should show request_receiver_temp" do
    get :show, id: @request_receiver_temp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_receiver_temp
    assert_response :success
  end

  test "should update request_receiver_temp" do
    patch :update, id: @request_receiver_temp, request_receiver_temp: { params: @request_receiver_temp.params, status: @request_receiver_temp.status }
    assert_redirected_to request_receiver_temp_path(assigns(:request_receiver_temp))
  end

  test "should destroy request_receiver_temp" do
    assert_difference('RequestReceiverTemp.count', -1) do
      delete :destroy, id: @request_receiver_temp
    end

    assert_redirected_to request_receiver_temps_path
  end
end
