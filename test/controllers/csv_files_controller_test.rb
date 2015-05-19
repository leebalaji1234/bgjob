require 'test_helper'

class CsvFilesControllerTest < ActionController::TestCase
  setup do
    @csv_file = csv_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csv_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csv_file" do
    assert_difference('CsvFile.count') do
      post :create, csv_file: { filename: @csv_file.filename, flocation: @csv_file.flocation, fsize: @csv_file.fsize, status: @csv_file.status }
    end

    assert_redirected_to csv_file_path(assigns(:csv_file))
  end

  test "should show csv_file" do
    get :show, id: @csv_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csv_file
    assert_response :success
  end

  test "should update csv_file" do
    patch :update, id: @csv_file, csv_file: { filename: @csv_file.filename, flocation: @csv_file.flocation, fsize: @csv_file.fsize, status: @csv_file.status }
    assert_redirected_to csv_file_path(assigns(:csv_file))
  end

  test "should destroy csv_file" do
    assert_difference('CsvFile.count', -1) do
      delete :destroy, id: @csv_file
    end

    assert_redirected_to csv_files_path
  end
end
