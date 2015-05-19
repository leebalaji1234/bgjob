json.array!(@optin_services) do |optin_service|
  json.extract! optin_service, :id, :phone, :status
  json.url optin_service_url(optin_service, format: :json)
end
