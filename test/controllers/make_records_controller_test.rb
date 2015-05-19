require 'test_helper'

class MakeRecordsControllerTest < ActionController::TestCase
  setup do
    @make_record = make_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:make_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create make_record" do
    assert_difference('MakeRecord.count') do
      post :create, make_record: { answeredtime: @make_record.answeredtime, callerid: @make_record.callerid, destination: @make_record.destination, dialedtime: @make_record.dialedtime, dialstatus: @make_record.dialstatus, endtime: @make_record.endtime, guid: @make_record.guid, reason: @make_record.reason, source: @make_record.source, templateid: @make_record.templateid, userid: @make_record.userid }
    end

    assert_redirected_to make_record_path(assigns(:make_record))
  end

  test "should show make_record" do
    get :show, id: @make_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @make_record
    assert_response :success
  end

  test "should update make_record" do
    patch :update, id: @make_record, make_record: { answeredtime: @make_record.answeredtime, callerid: @make_record.callerid, destination: @make_record.destination, dialedtime: @make_record.dialedtime, dialstatus: @make_record.dialstatus, endtime: @make_record.endtime, guid: @make_record.guid, reason: @make_record.reason, source: @make_record.source, templateid: @make_record.templateid, userid: @make_record.userid }
    assert_redirected_to make_record_path(assigns(:make_record))
  end

  test "should destroy make_record" do
    assert_difference('MakeRecord.count', -1) do
      delete :destroy, id: @make_record
    end

    assert_redirected_to make_records_path
  end
end
