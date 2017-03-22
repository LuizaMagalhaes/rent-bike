class BikesController < ApplicationController
  def index
    @advertisements = Advertisement.all
    @bikes = Bike.all
  end
end
