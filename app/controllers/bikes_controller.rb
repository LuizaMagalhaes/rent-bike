class BikesController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end


end
