class RentsController < ApplicationController
  def new
    @advertisement = Advertisement.find(params[:advertisement_id])
    @rent = Rent.new
    @rent.build_customer
  end

  def create
    @advertisement = Advertisement.find(params[:advertisement_id])
    rent = @advertisement.rents.create(rent_params)
    rent.price = @advertisement.price
    rent.save
    flash[:success] = "Aluguel Confirmado por R$ #{rent.price},
    na data #{rent.rent_date}"
    redirect_to [@advertisement, rent]
  end

  def show
    @rent = Rent.find(params[:id])
  end

  private

  def rent_params
    params.require(:rent).permit(:rent_date, :payment,
    customer_attributes: [:name, :phone, :cpf, :email, :id, :_destroy])
  end
end
