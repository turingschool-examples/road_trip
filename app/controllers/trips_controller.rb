class TripsController <ApplicationController
  def index
    @trips = Trip.all_by_mileage
  end
end
