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
      @show = Show.new({title: params[:title], date: params[:date], poster_link: params[:poster_link],
        venue_id: params[:venue_id]})

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
