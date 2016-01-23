class VenuesController < ApplicationController
  def index
      @venues = Venue.all
      render json: @venues, status: :ok
  end

  def show
      @venue = Venue.find(params[:id])
      render json: @venue
  end

  def create
      @venue = Venue.new({venue_name: params[:venue_name], address: params[:address],
        venue_website: params[:venue_website]})

      if @venue.save
          render json: @venue, status: :created
      else
          render json: @venue.errors, status: :unprocessable_entity
      end
  end

  def update
      @venue = Venue.find(params[:id])
      if @venue.update({venue_name: params[:venue_name], address: params[:address],
        venue_website: params[:venue_website]})
          head :no_content
      else
          render json: @venue.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @venue = Venue.find(params[:id])
      @venue.destroy

      head :no_content
  end

  private

  def show_params
    params.require(@venue).permit(:venue_name, :address, :venue_website)
  end

end