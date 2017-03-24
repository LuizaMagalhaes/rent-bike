class AdvertisementsController < ApplicationController
  def show
    @advertisement = Advertisement.find(params[:id])
    @bike = Bike.find(params[:id])
    @availability = ""
    7.times do |day|
      @availability += "#{day + Time.zone.today.day} "
    end
    @availability += "/#{Time.zone.today.month}/#{Time.zone.today.year}"
  end
end
