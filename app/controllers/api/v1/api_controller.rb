module Api::V1
  class ApiController < ActionController::API

    protected

    def error!(message, status)
      render json: { error: message }, status: status
    end

    def unauthorized!
      error!('Unauthorized', 401)
    end

    def forbidden!
      error!('forbidden',403)
    end
  end
end