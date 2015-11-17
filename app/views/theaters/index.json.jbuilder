json.array!(@theaters) do |theater|
  json.extract! theater, :id, :name, :adress
  json.url theater_url(theater, format: :json)
end
