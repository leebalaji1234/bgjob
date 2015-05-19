json.array!(@csv_file_temps) do |csv_file_temp|
  json.extract! csv_file_temp, :id, :filename, :flocation, :fsize, :status
  json.url csv_file_temp_url(csv_file_temp, format: :json)
end
