class AdvertisementsController < ApplicationController
  

  def show
    @advertisements = Advertisement.all
    @advertisement = Advertisement.find(params[:id])
    @bike = Bike.find(params[:id])
    @availabilities = 7.times.map do |n|
      Time.zone.today + n.day
    end
    @availabilities -= @advertisement.rents.pluck(:rent_date)
  end
end
