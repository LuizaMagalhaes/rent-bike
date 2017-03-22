class AdvertisementsController < ApplicationController
  def show
    @advertisement = Advertisement.all
    @bike = Bike.find(params[:id])
  end
end
