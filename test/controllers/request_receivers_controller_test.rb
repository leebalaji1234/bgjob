require 'test_helper'

class RequestReceiversControllerTest < ActionController::TestCase
  setup do
    @request_receiver = request_receivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_receivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_receiver" do
    assert_difference('RequestReceiver.count') do
      post :create, request_receiver: { code: @request_receiver.code, guid: @request_receiver.guid, message: @request_receiver.message, ori_params: @request_receiver.ori_params, status: @request_receiver.status, val_params: @request_receiver.val_params }
    end

    assert_redirected_to request_receiver_path(assigns(:request_receiver))
  end

  test "should show request_receiver" do
    get :show, id: @request_receiver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_receiver
    assert_response :success
  end

  test "should update request_receiver" do
    patch :update, id: @request_receiver, request_receiver: { code: @request_receiver.code, guid: @request_receiver.guid, message: @request_receiver.message, ori_params: @request_receiver.ori_params, status: @request_receiver.status, val_params: @request_receiver.val_params }
    assert_redirected_to request_receiver_path(assigns(:request_receiver))
  end

  test "should destroy request_receiver" do
    assert_difference('RequestReceiver.count', -1) do
      delete :destroy, id: @request_receiver
    end

    assert_redirected_to request_receivers_path
  end
end
