# app/controllers/api/v1/users_controller.rb

module Api::V1
  class HealthController < ApiController
    def index
      render plain: 'OK 200'
    end
  end
end