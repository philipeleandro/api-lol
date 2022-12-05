class HomeController < ApplicationController
  def welcome
    @response_body = AccountLeagueOfLegends.return_info(params[:search])
  end
end