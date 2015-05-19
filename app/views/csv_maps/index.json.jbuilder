json.array!(@csv_maps) do |csv_map|
  json.extract! csv_map, :id, :userid, :csvid, :guid, :status
  json.url csv_map_url(csv_map, format: :json)
end
