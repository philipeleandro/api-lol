class SummonerMatchesController < ApplicationController
  def index
    @account_info = AccountLeagueOfLegends.return_info(params['nickname'])
    @rank = AccountLeagueOfLegends.return_rank(@account_info['id'])
  end
end