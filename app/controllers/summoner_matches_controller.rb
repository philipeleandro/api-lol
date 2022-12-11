class SummonerMatchesController < ApplicationController
  def index
    @account_info = AccountLeagueOfLegends.return_info(params['nickname'])

    if @account_info.nil?
      flash.now[:alert] = 'Você deve voltar para o ínicio'
      render 'index'
    else
      @rank = AccountLeagueOfLegends.return_rank(@account_info['id'])
      @history_and_players = AccountLeagueOfLegends.search_for_player_from_history(@account_info['puuid'])
    end
  end
end