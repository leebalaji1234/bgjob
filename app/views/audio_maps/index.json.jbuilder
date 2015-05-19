json.array!(@audio_maps) do |audio_map|
  json.extract! audio_map, :id, :userid, :audioid, :guid, :cliporder, :status
  json.url audio_map_url(audio_map, format: :json)
end
