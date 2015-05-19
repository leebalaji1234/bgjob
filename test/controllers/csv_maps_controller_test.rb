require 'test_helper'

class CsvMapsControllerTest < ActionController::TestCase
  setup do
    @csv_map = csv_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csv_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csv_map" do
    assert_difference('CsvMap.count') do
      post :create, csv_map: { csvid: @csv_map.csvid, guid: @csv_map.guid, status: @csv_map.status, userid: @csv_map.userid }
    end

    assert_redirected_to csv_map_path(assigns(:csv_map))
  end

  test "should show csv_map" do
    get :show, id: @csv_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csv_map
    assert_response :success
  end

  test "should update csv_map" do
    patch :update, id: @csv_map, csv_map: { csvid: @csv_map.csvid, guid: @csv_map.guid, status: @csv_map.status, userid: @csv_map.userid }
    assert_redirected_to csv_map_path(assigns(:csv_map))
  end

  test "should destroy csv_map" do
    assert_difference('CsvMap.count', -1) do
      delete :destroy, id: @csv_map
    end

    assert_redirected_to csv_maps_path
  end
end
