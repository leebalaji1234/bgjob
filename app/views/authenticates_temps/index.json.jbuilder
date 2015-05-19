json.array!(@authenticates_temps) do |authenticates_temp|
  json.extract! authenticates_temp, :id, :params, :status, :guid
  json.url authenticates_temp_url(authenticates_temp, format: :json)
end
