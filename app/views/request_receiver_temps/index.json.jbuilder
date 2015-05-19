json.array!(@request_receiver_temps) do |request_receiver_temp|
  json.extract! request_receiver_temp, :id, :params, :guid, :status
  json.url request_receiver_temp_url(request_receiver_temp, format: :json)
end
