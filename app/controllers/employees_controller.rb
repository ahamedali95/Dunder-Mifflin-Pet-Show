class EmployeesController < ApplicationController
  before_action :get_employee, only: [:show, :edit, :destroy, :update]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    # @employee = Employee.create(employee_params)
    # if @employee.valid?
    #   redirect_to @employee
    # raise params.inspect
    @employee = Employee.create(employee_params)

    if @employee.valid?
      redirect_to @employee
    else
      flash[:error] = @employee.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    flash[:notice] = "You Monster! #{@employee.full_name}'\s funeral will be this weekend."
    redirect_to employees_path
  end
  private

  def get_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
  end
end
