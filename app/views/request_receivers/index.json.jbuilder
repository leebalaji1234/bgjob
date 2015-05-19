json.array!(@request_receivers) do |request_receiver|
  json.extract! request_receiver, :id, :ori_params, :val_params, :message, :code, :guid, :status
  json.url request_receiver_url(request_receiver, format: :json)
end
