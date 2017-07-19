ActiveModelSerializers.config.tap do |c|
  c.adapter = :json_api
  c.jsonapi_version = "1.0"
end
