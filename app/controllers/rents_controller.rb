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
    flash[:success] = "Aluguel Confirmado por #{rent_params[:price]}
    #{rent_params[:payment]},
    na data #{rent_params[:rent_date]}, pelo cliente
    #{rent_params[:customer_attributes][:name]}
    telefone #{rent_params[:customer_attributes][:phone]}
    #{rent_params[:customer_attributes][:cpf]}
    #{rent_params[:customer_attributes][:email]}"
    redirect_to [@advertisement, rent]
  end

  private

  def rent_params
    params.require(:rent).permit(:rent_date, :payment,
    customer_attributes: [:name, :phone, :cpf, :email, :id, :_destroy])
  end
end
