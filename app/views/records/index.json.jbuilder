json.array!(@records) do |record|
  json.extract! record, :id, :guid, :userid, :callerid, :source, :destination, :templateid, :dialedtime, :answeredtime, :endtime, :dialstatus, :reason
  json.url record_url(record, format: :json)
end
