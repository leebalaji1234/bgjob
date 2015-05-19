json.array!(@generators) do |generator|
  json.extract! generator, :id, :userid, :guid, :csvfile, :csvcount, :processedcount, :status
  json.url generator_url(generator, format: :json)
end
