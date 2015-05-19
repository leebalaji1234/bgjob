require 'test_helper'

class CallTemplatesControllerTest < ActionController::TestCase
  setup do
    @call_template = call_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:call_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create call_template" do
    assert_difference('CallTemplate.count') do
      post :create, call_template: { desc: @call_template.desc, flocation: @call_template.flocation, mode: @call_template.mode, name: @call_template.name }
    end

    assert_redirected_to call_template_path(assigns(:call_template))
  end

  test "should show call_template" do
    get :show, id: @call_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @call_template
    assert_response :success
  end

  test "should update call_template" do
    patch :update, id: @call_template, call_template: { desc: @call_template.desc, flocation: @call_template.flocation, mode: @call_template.mode, name: @call_template.name }
    assert_redirected_to call_template_path(assigns(:call_template))
  end

  test "should destroy call_template" do
    assert_difference('CallTemplate.count', -1) do
      delete :destroy, id: @call_template
    end

    assert_redirected_to call_templates_path
  end
end
