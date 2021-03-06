class Admin::PassengerCarsController < Admin::BaseController
  before_action :set_passenger_car, only: [:show, :edit, :update, :destroy]
  before_action :set_type_list, only: [:show, :edit]

  def index
    @passenger_cars = PassengerCar.all
  end

  def show
  end

  def new
    @passenger_car = PassengerCar.new
  end

  def edit
  end

  def create
    @passenger_car = PassengerCar.new(passenger_car_params)

    if @passenger_car.save
      redirect_to [:admin, @passenger_car], notice: 'Passenger car was successfully created.'
    else
      render :new
    end
  end

  def update
    if @passenger_car.update(passenger_car_params)
      redirect_to [:admin, @passenger_car], notice: 'Passenger car was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @passenger_car.destroy
    redirect_to admin_passenger_cars_path, notice: 'Passenger car was successfully destroyed.'
  end

  private
  
  def set_passenger_car
    @passenger_car = PassengerCar.find(params[:id])
  end

  def passenger_car_params
    params.require(:passenger_car).permit(:number, :train_id, :type, 
                                          :upper_seats, :lower_seats, :sitting_seats,
                                          :upper_lateral_seats, :lower_lateral_seats)
  end

  def set_type_list
    @car_type = PassengerCar.subclasses
  end
end
