class HomeController < ApplicationController
  def welcome
    if params[:search].present?
      @account_info = AccountLeagueOfLegends.return_info(params[:search])
      
      if @account_info['id'].present?
        @encrypt_summoner_info = EncryptAndDecrypt.encrypt_summoner_info(@account_info)
        redirect_to controller: 'summoner_matches', action: 'index', params: { nickname: params[:search], summoner_info: @encrypt_summoner_info }
      else
        flash.now[:alert] = 'Invocador não encontrado!'
        render 'welcome'
      end
    end
  end
end