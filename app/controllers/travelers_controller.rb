class TravelersController < ApplicationController
  def show
    @traveler = Traveler.find(params[:id])
  end

  def create
    
  end
end
