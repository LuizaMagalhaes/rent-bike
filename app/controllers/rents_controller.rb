class RentsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @advertisement = Advertisement.find(params[:advertisement_id])
    @rent = Rent.new
    @rent.build_customer
  end

  def create
    @advertisement = Advertisement.find(params[:advertisement_id])
    rent_date = params[:rent][:rent_date]
    rented = false
    @advertisement.rents.each do |rent|
      if rent.rent_date = rent_date
        rented = true
      end
    end

    unless rented
      rent = @advertisement.rents.create(rent_params)
      rent.price = @advertisement.price
      rent.customer = current_customer
      rent.save

      flash[:success] = "Aluguel Confirmado por R$ #{rent.price},
      na data #{l rent.rent_date}"
      redirect_to [@advertisement, rent]
    else
      flash[:error] = "Ops... Essa bike já está alugada no dia #{rent_date} :("
      redirect_to @advertisement
    end
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
