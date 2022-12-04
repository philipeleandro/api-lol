class HomeController < ApplicationController
  def welcome
    unless params[:search].blank?
      summoner_name = params[:search]
      response = Faraday.get("https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name.gsub(' ','%20')}?api_key=RGAPI-8ace8ea7-b33a-4a78-8fd3-f3a73b1049a4")
      @response_body = JSON.parse(response.body)
    end
  end
end