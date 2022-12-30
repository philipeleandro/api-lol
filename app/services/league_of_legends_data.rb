class LeagueOfLegendsData
  def self.name_champions
    ConvertToJson.body_info(RiotRequest.champions_name.body)['data'].keys
  end

  def self.champion_data(name)
    ConvertToJson.body_info(RiotRequest.champion_info(name).body)
  end
end