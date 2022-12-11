class RiotRequest
  def self.summoner_info(summoner_name)
    Faraday.get("https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name.gsub(' ','%20')}?api_key=#{ENV['API_LOL']}")
  end

  def self.rank(id)
    Faraday.get("https://br1.api.riotgames.com/lol/league/v4/entries/by-summoner/#{id}?api_key=#{ENV['API_LOL']}")
  end

  def self.match_history(puuid)
    Faraday.get("https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/#{puuid}/ids?start=0&count=5&api_key=#{ENV['API_LOL']}")
  end

  def self.match_info(match_id)
    Faraday.get("https://americas.api.riotgames.com/lol/match/v5/matches/#{match_id}?api_key=#{ENV['API_LOL']}")
  end

  def self.summoner_info_by_puuid(puuid)
    Faraday.get("https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/#{puuid}?api_key=#{ENV['API_LOL']}")
  end
end

