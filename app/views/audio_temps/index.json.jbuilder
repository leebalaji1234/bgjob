json.array!(@audio_temps) do |audio_temp|
  json.extract! audio_temp, :id, :audioname, :flocation, :fsize, :ftlocation, :status
  json.url audio_temp_url(audio_temp, format: :json)
end
