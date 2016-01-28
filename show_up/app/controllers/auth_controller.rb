require 'jwt'

class AuthController < ApplicationController
  def authenticate
    # You'll need to implement the below method. It should return the
    # user instance if the username and password are valid.
    # Otherwise return nil.
    band = Band.find_by_credentials(params[:band_name], params[:password])
    # binding.pry
    if band
      render json: authentication_payload(band)
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  def create
    band = Band.new(band_params)
    if band.save
      render json: authentication_payload(band), status: :created
    else
      render json: band.errors, status: :unprocessable_entity
    end
  end

  private

  def authentication_payload(band)
    return nil unless band && band.id
    {
      auth_token: AuthToken.encode({ band_id: band.id }),
      band: { id: band.id, band_name: band.band_name } # return whatever user info you need
    }
  end

  def band_params
    params.permit(:band_name, :email, :password, :password_confirmation, :band_website, :photo_link)
  end

end
