class ShowsController < ApplicationController
  def index
      @shows = Show.all
      render json: @shows, status: :ok
  end

  def show
      @show = Show.find(params[:id])
      render json: @show
  end

  def create
      @venue = Venue.find_by(venue_name:params[:venue_name])

      @show = Show.new({title: params[:title], date: params[:date], poster_link: params[:poster_link],
        venue_id: @venue.id })

        @band1 = Band.find_by(band_name: params[:first_band])
        @band2 = Band.find_by(band_name: params[:second_band])
        @band3 = Band.find_by(band_name: params[:third_band])
        @band4 = Band.find_by(band_name: params[:fourth_band])

        @show.bands << @band1.id
        # bandshow.create(band_id: @band1.id, show_id: @show.id)
      # JoinTableBandsShows.create(band_id: @band2.id, show_id: @show.id)
      # JoinTableBandsShows.create(band_id: @band3.id, show_id: @show.id)
      # JoinTableBandsShows.create(band_id: @band4.id, show_id: @show.id)

      if @show.save
          render json: @show, status: :created
      else
          render json: @show.errors, status: :unprocessable_entity
      end
  end

  def update
      @show = Show.find(params[:id])
      if @show.update({title: params[:title], date: params[:date], poster_link: params[:poster_link],
        venue_id: params[:venue_id]})
          head :no_content
      else
          render json: @show.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @show = Show.find(params[:id])
      @show.destroy

      head :no_content
  end

  private

  def show_params
    params.require(@show).permit(:title, :date, :poster_link, :venue_id)
  end
end
