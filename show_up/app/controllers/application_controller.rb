class AccessDeniedError < StandardError
end
class NotAuthenticatedError < StandardError
end
class AuthenticationTimeoutError < StandardError
end


class ApplicationController < ActionController::API
  attr_reader :current_band

  rescue_from AuthenticationTimeoutError, with: :authentication_timeout
  rescue_from NotAuthenticatedError, with: :band_not_authenticated

  # def current_user
  #   @current_user ||= Band.find(session[:band_id]) if session[:band_id]
  # end
  #
  # def authorize
  #   unless current_user
  #     return false
  #   end
  # end
  protected

  # This method gets the current user based on the user_id included
  # in the Authorization header (json web token).
  #
  # Call this from child controllers in a before_action or from
  # within the action method itself
  def authenticate_request!
    fail NotAuthenticatedError unless band_id_included_in_auth_token?
    @current_band = Band.find(decoded_auth_token[:band_id])
    rescue JWT::ExpiredSignature
    raise AuthenticationTimeoutError
    rescue JWT::VerificationError, JWT::DecodeError
    raise NotAuthenticatedError
  end

  private

  # Authentication Related Helper Methods
  # ------------------------------------------------------------
  def band_id_included_in_auth_token?
    http_auth_token && decoded_auth_token && decoded_auth_token[:band_id]
  end

  # Decode the authorization header token and return the payload
  def decoded_auth_token
    @decoded_auth_token ||= AuthToken.decode(http_auth_token)
  end

  # Raw Authorization Header token (json web token format)
  # JWT's are stored in the Authorization header using this format:
  # Bearer somerandomstring.encoded-payload.anotherrandomstring
  def http_auth_token
    @http_auth_token ||= if request.headers['Authorization'].present?
                           request.headers['Authorization'].split(' ').last
                         end
  end

  # Helper Methods for responding to errors
  # ------------------------------------------------------------
  def authentication_timeout
    render json: { errors: ['Authentication Timeout'] }, status: 419
  end
  def forbidden_resource
    render json: { errors: ['Not Authorized To Access Resource'] }, status: :forbidden
  end
  def band_not_authenticated
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

end
