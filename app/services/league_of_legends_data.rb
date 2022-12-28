class LeagueOfLegendsData
  def self.name_champions
    ConvertToJson.body_info(RiotRequest.champions.body)['data'].keys
  end

  def self.champion_data(name)
    request = Faraday.get("https://ddragon.leagueoflegends.com/cdn/12.23.1/data/pt_BR/champion/#{name}.json")

    ConvertToJson.body_info(request.body)
  end
end