class HomeController < ApplicationController
  def welcome
    @account_info = AccountLeagueOfLegends.return_info(params[:search])
    @rank = AccountLeagueOfLegends.return_rank(@account_info['id'])
  end
end