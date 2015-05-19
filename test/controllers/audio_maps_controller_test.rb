require 'test_helper'

class AudioMapsControllerTest < ActionController::TestCase
  setup do
    @audio_map = audio_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audio_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audio_map" do
    assert_difference('AudioMap.count') do
      post :create, audio_map: { audioid: @audio_map.audioid, cliporder: @audio_map.cliporder, guid: @audio_map.guid, status: @audio_map.status, userid: @audio_map.userid }
    end

    assert_redirected_to audio_map_path(assigns(:audio_map))
  end

  test "should show audio_map" do
    get :show, id: @audio_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audio_map
    assert_response :success
  end

  test "should update audio_map" do
    patch :update, id: @audio_map, audio_map: { audioid: @audio_map.audioid, cliporder: @audio_map.cliporder, guid: @audio_map.guid, status: @audio_map.status, userid: @audio_map.userid }
    assert_redirected_to audio_map_path(assigns(:audio_map))
  end

  test "should destroy audio_map" do
    assert_difference('AudioMap.count', -1) do
      delete :destroy, id: @audio_map
    end

    assert_redirected_to audio_maps_path
  end
end
