module ApiService
  def parse(json_string)
    JSON.parse(json_string, symbolize_names: true)
  end
end
