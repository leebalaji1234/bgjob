json.array!(@answer_records) do |answer_record|
  json.extract! answer_record, :id, :guid, :userid, :callerid, :source, :destination, :templateid, :dialedtime, :answeredtime, :endtime, :dialstatus, :reason
  json.url answer_record_url(answer_record, format: :json)
end
