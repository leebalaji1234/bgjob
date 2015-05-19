json.array!(@make_records) do |make_record|
  json.extract! make_record, :id, :guid, :userid, :callerid, :source, :destination, :templateid, :dialedtime, :answeredtime, :endtime, :dialstatus, :reason
  json.url make_record_url(make_record, format: :json)
end
