class AdvertisementsController < ApplicationController
  def show
    @advertisement = Advertisement.find(params[:id])
    @bike = Bike.find(params[:id])
  end
end
