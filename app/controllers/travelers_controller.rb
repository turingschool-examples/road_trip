class TravelersController <ApplicationController
  def show
    @traveler = Traveler.find(params[:id])
  end

  def update
    traveler = Traveler.find(params[:id])
    if params[:trip_id]
      trip = Trip.find(params[:trip_id])
      TravelerTrip.create(traveler: traveler, trip: trip)
    end
    redirect_to "/travelers/#{params[:id]}"
  end
end
