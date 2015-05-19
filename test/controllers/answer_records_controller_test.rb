require 'test_helper'

class AnswerRecordsControllerTest < ActionController::TestCase
  setup do
    @answer_record = answer_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer_record" do
    assert_difference('AnswerRecord.count') do
      post :create, answer_record: { answeredtime: @answer_record.answeredtime, callerid: @answer_record.callerid, destination: @answer_record.destination, dialedtime: @answer_record.dialedtime, dialstatus: @answer_record.dialstatus, endtime: @answer_record.endtime, guid: @answer_record.guid, reason: @answer_record.reason, source: @answer_record.source, templateid: @answer_record.templateid, userid: @answer_record.userid }
    end

    assert_redirected_to answer_record_path(assigns(:answer_record))
  end

  test "should show answer_record" do
    get :show, id: @answer_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answer_record
    assert_response :success
  end

  test "should update answer_record" do
    patch :update, id: @answer_record, answer_record: { answeredtime: @answer_record.answeredtime, callerid: @answer_record.callerid, destination: @answer_record.destination, dialedtime: @answer_record.dialedtime, dialstatus: @answer_record.dialstatus, endtime: @answer_record.endtime, guid: @answer_record.guid, reason: @answer_record.reason, source: @answer_record.source, templateid: @answer_record.templateid, userid: @answer_record.userid }
    assert_redirected_to answer_record_path(assigns(:answer_record))
  end

  test "should destroy answer_record" do
    assert_difference('AnswerRecord.count', -1) do
      delete :destroy, id: @answer_record
    end

    assert_redirected_to answer_records_path
  end
end
