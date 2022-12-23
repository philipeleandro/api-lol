class HomeController < ApplicationController
  before_action :set_encode_nick, only: [:welcome]

  def welcome
    if params[:search].present?
      params[:search] = params[:search].join('')

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

  private

  def set_encode_nick
    if params[:search].present? 
      params[:search] = params[:search].force_encoding('iso-8859-1').split('')

       params[:search].each_with_index do |char,index|
        if char.match?(/\W/)
           params[:search][index] = '%' + "%02X" % [ char.ord ]
        end
      end
    end
  end
end