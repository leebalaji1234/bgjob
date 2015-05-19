require 'test_helper'

class AudioTempsControllerTest < ActionController::TestCase
  setup do
    @audio_temp = audio_temps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audio_temps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audio_temp" do
    assert_difference('AudioTemp.count') do
      post :create, audio_temp: { audioname: @audio_temp.audioname, flocation: @audio_temp.flocation, fsize: @audio_temp.fsize, ftlocation: @audio_temp.ftlocation, status: @audio_temp.status }
    end

    assert_redirected_to audio_temp_path(assigns(:audio_temp))
  end

  test "should show audio_temp" do
    get :show, id: @audio_temp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audio_temp
    assert_response :success
  end

  test "should update audio_temp" do
    patch :update, id: @audio_temp, audio_temp: { audioname: @audio_temp.audioname, flocation: @audio_temp.flocation, fsize: @audio_temp.fsize, ftlocation: @audio_temp.ftlocation, status: @audio_temp.status }
    assert_redirected_to audio_temp_path(assigns(:audio_temp))
  end

  test "should destroy audio_temp" do
    assert_difference('AudioTemp.count', -1) do
      delete :destroy, id: @audio_temp
    end

    assert_redirected_to audio_temps_path
  end
end
