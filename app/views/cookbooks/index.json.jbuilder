json.array!(@cookbooks) do |cookbook|
  json.extract! cookbook, :id, :user_id, :name
  json.url cookbook_url(cookbook, format: :json)
end
