json.array!(@levels) do |level|
  json.extract! level, :id, :name, :value
  json.url level_url(level, format: :json)
end
