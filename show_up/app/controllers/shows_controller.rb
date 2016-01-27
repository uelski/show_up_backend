class ShowsController < ApplicationController
  def index
    authorize
      @shows = Show.all
      render json: @shows, status: :ok
  end

  def show
      @show = Show.find(params[:id])
      render json: @show
  end

  def showBand
    @show = Show.find(params[:id])
    render json: @show.bands
  end

  def create
    authorize
      @venue = Venue.find_by(venue_name:params[:venue_name])
      @band1 = Band.find_by(band_name: params[:first_band])
      @band2 = Band.find_by(band_name: params[:second_band])
      @band3 = Band.find_by(band_name: params[:third_band])
      @band4 = Band.find_by(band_name: params[:fourth_band])

      @show = Show.new({title: params[:title], date: params[:date], poster_link: params[:poster_link],
        venue_name: params[:venue_name], venue_id: @venue.id })


        #binding.pry

      if @show.save
        if (@band1 != nil )
          BandShow.create({band_id: @band1.id, show_id: @show.id})
        end
        if (@band2 != nil )
          BandShow.create({band_id: @band2.id, show_id: @show.id})
        end
        if (@band3 != nil )
          BandShow.create({band_id: @band3.id, show_id: @show.id})
        end
        if (@band4 != nil)
          BandShow.create({band_id: @band4.id, show_id: @show.id})
        end
          render json: @show, status: :created
      else
          render json: @show.errors, status: :unprocessable_entity
      end
  end

  def update
    authorize
      @show = Show.find(params[:id])
      if @show.update({title: params[:title], date: params[:date], poster_link: params[:poster_link],
        venue_id: params[:venue_id]})
          head :no_content
      else
          render json: @show.errors, status: :unprocessable_entity
      end
  end

  def destroy
    authorize
    @show = Show.find(params[:id])
      @show.destroy

      head :no_content
  end

  private

  def show_params
    params.require(@show).permit(:title, :date, :poster_link, :venue_id)
  end
end
