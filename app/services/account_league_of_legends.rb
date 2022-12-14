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

  def self.return_match_history(puuid)
    unless puuid.blank?
      ConvertToJson.body_info(RiotRequest.match_history(puuid).body)
    end
  end

  def self.return_match_info(match_id)
    unless match_id.blank?
      ConvertToJson.body_info(RiotRequest.match_info(match_id).body)['metadata']['participants']
    end
  end

  def self.return_summoner_info_by_puuid(puuid)
    unless puuid.blank?
      ConvertToJson.body_info(RiotRequest.summoner_info_by_puuid(puuid).body)
    end
  end

  def self.search_for_player_from_history(puuid)
    unless puuid.blank?
      id_matches = return_match_history(puuid)

      id_matches.map! { |match_id| return_match_info(match_id) }.map! do |summoners|
        summoners.map! do |summoner|
          summoner_info = return_summoner_info_by_puuid(summoner)
          summoner_rank = return_rank(summoner_info['id'])

          "#{summoner_info['name']} - Level: #{summoner_info['summonerLevel']}"
        end
      end
    end
  end
end
