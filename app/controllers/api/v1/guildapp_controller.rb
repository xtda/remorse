# app/controllers/api/v1/users_controller.rb
module Api::V1
  class GuildappController < ApiController
    include ApplicationController::WowHelper
    def index
      render plain: 'OK 200'
    end

    def show
      render json: player_information(params[:realm], params[:char])
    end

    def recruiting
      recruiting = Setting.find_by(name: 'recruitment')
      render json: recruiting['setting']
    end
  end
end
