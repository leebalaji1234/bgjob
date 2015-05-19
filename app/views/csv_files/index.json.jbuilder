json.array!(@csv_files) do |csv_file|
  json.extract! csv_file, :id, :filename, :flocation, :fsize, :status
  json.url csv_file_url(csv_file, format: :json)
end
