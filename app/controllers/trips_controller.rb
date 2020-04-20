class TripsController <ApplicationController
  def index
    @trips = Trip.all_by_mileage
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    
  end
end
