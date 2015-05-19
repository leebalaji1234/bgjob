require 'test_helper'

class CsvFileTempsControllerTest < ActionController::TestCase
  setup do
    @csv_file_temp = csv_file_temps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csv_file_temps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csv_file_temp" do
    assert_difference('CsvFileTemp.count') do
      post :create, csv_file_temp: { filename: @csv_file_temp.filename, flocation: @csv_file_temp.flocation, fsize: @csv_file_temp.fsize, status: @csv_file_temp.status }
    end

    assert_redirected_to csv_file_temp_path(assigns(:csv_file_temp))
  end

  test "should show csv_file_temp" do
    get :show, id: @csv_file_temp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csv_file_temp
    assert_response :success
  end

  test "should update csv_file_temp" do
    patch :update, id: @csv_file_temp, csv_file_temp: { filename: @csv_file_temp.filename, flocation: @csv_file_temp.flocation, fsize: @csv_file_temp.fsize, status: @csv_file_temp.status }
    assert_redirected_to csv_file_temp_path(assigns(:csv_file_temp))
  end

  test "should destroy csv_file_temp" do
    assert_difference('CsvFileTemp.count', -1) do
      delete :destroy, id: @csv_file_temp
    end

    assert_redirected_to csv_file_temps_path
  end
end
