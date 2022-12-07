class RiotRequest
  def self.summoner_info(summoner_name)
    Faraday.get("https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name.gsub(' ','%20')}?api_key=#{ENV['API_LOL']}")
  end

  def self.rank(id)
    Faraday.get("https://br1.api.riotgames.com/lol/league/v4/entries/by-summoner/#{id}?api_key=#{ENV['API_LOL']}")
  end
end