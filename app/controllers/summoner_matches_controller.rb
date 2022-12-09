class SummonerMatchesController < ApplicationController
  def index
    @account_info = AccountLeagueOfLegends.return_info(params['nickname'])

    if @account_info.nil?
      flash.now[:alert] = 'Você deve voltar para o ínicio'
      render 'index'
    else
      @account_info
      @rank = AccountLeagueOfLegends.return_rank(@account_info['id'])
    end
  end
end