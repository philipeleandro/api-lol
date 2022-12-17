class SummonerMatchesController < ApplicationController
  def index
    if params[:summoner_info].nil?
      flash.now[:alert] = 'Você deve voltar para o ínicio'
      render 'index'
    else
      @account_info = EncryptAndDecrypt.decrypt_summoner_info(params[:summoner_info])
      @rank = AccountLeagueOfLegends.return_rank(@account_info['id'])
      @history_and_players = AccountLeagueOfLegends.search_for_player_from_history(@account_info['puuid'])
    end
  end

  def show
    redirect_to controller: 'home', action: 'welcome', params: { search: params[:search] }
  end
end