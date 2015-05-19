json.array!(@call_templates) do |call_template|
  json.extract! call_template, :id, :name, :desc, :flocation, :mode
  json.url call_template_url(call_template, format: :json)
end
