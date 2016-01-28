# class SessionsController < ApplicationController
#   def new
#   end
#
#   def create
#     band = Band.find_by(band_name: params[:band_name])
#     if band && band.authenticate(params[:password])
#     session[:band_id] = band.id
#     redirect_to "http://localhost:5000/"
#     else
#     redirect_to "http://localhost:5000/login"
#     end
#   end
#
#   def show
#     @band = Band.find(params[:session][:band_id])
#     render json: @band.band_name
#   end
#
#   def destroy
#     session = nil
#     redirect_to "http://localhost:5000/"
#   end
# end
