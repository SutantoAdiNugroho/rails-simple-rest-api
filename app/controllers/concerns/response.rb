# frozen_string_literal: true

class Response
  def json_response(object, message, status = :ok)
    render json: {
      message: message,
      values: object
    }, status: status
  end
end
