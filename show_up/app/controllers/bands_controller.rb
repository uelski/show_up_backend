class BandsController < ApplicationController
  def index
    @bands = Band.all
    render json: @bands, status: :ok
  end

  def show
      @band = Band.find(params[:id])

      render json: @band
  end


  def new
    @band = Band.new
  end

  def create
    @band = Band.new({band_name: params[:band_name], email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation], band_website: params[:band_website],
      photo_link: params[:photo_link]})
    if @band.save
      render json: @band, status: :created
    end
  end

  private
  def band_params
    params.require(@band).permit(:band_name, :email, :password, :password_confirmation, :band_website, :photo_link)
  end
end
