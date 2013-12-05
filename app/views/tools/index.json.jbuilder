json.array!(@tools) do |tool|
  json.extract! tool, 
  json.url tool_url(tool, format: :json)
end