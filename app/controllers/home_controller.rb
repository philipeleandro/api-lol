class HomeController < ApplicationController
  def welcome
    @account_info = AccountLeagueOfLegends.return_info(params[:search])
    @rank = ConvertToJson.body_info(RiotRequest.rank(@account_info['id']).body)
  end
end