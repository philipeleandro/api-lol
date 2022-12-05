class ConvertToJson
  def self.body_info(object)
    JSON.parse(object)
  end
end