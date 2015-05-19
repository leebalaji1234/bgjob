json.array!(@audios) do |audio|
  json.extract! audio, :id, :audioname, :flocation, :status
  json.url audio_url(audio, format: :json)
end
