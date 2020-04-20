class TripsController < ApplicationController

    def index
        @trips = Trip.all.sort
    end
    
end