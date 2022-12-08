class HomeController < ApplicationController
  def welcome
    if params[:search].present?
     @account_info = AccountLeagueOfLegends.return_info(params[:search])

      if @account_info['id'].present?
        redirect_to controller: 'summoner_matches', action: 'index', params: { nickname: params[:search] }
      else
        flash.now[:alert] = 'Invocador não encontrado!'
        render 'welcome'
      end
    end
  end
end