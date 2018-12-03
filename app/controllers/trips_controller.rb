# frozen_string_literal: true

class TripsController < OpenReadController
  before_action :set_trip, only: %i[update destroy]
  # before_action :set_trip, only: %i[update destroy show]

  # GET /trips
  def index
    @trips = Trip.all
    # console.log('index() current_user.trips = ' + current_user.trips)
    # @trips = current_user.trips
    render json: @trips
  end

  # GET /trips/1
  def show
    render json: Trip.find(params[:id])
    # render json: @trip
  end

  # POST /trips
  def create
    @trip = current_user.trips.build(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy

    head :no_content
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def trip_params
    params.require(:trip).permit(:location, :date, :equipment)
  end

  private :set_trip, :trip_params
end
