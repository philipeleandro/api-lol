class AccountLeagueOfLegends
  def self.return_info(summoner_name)
    unless summoner_name.blank?
      ConvertToJson.body_info(RiotRequest.summoner_info(summoner_name).body)
    end
  end

  def self.return_rank(id)
    unless id.blank?
      ConvertToJson.body_info(RiotRequest.rank(id).body)
    end
  end
end