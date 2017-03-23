class RentsController < ApplicationController
  def new
    @advertisement = Advertisement.find(params[:advertisement_id])
    @rent = Rent.new
  end

  def create
    @advertisement = Advertisement.find(params[:advertisement_id])
    @advertisement.rents.create(rent_params)
    redirect_to @advertisement
  end

  private

  def rent_params

  end
end
