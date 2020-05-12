class Api::V1::Employees::EmployeesSessionsController < ApplicationController
  def create
    @employee = Employee.find_by(email: params[:employees_session][:email])
    byebug
    if @employee && @employee.authenticate(params[:session][:password])
      session[:employee_id] = @employee.id
      render json: EmployeeSerializer.new(@employee), status: :ok
    else
      render json:{
        error: "Invalid Login"
      }
    end
  end

  def get_current_employee
    if logged_in?
      render json: EmployeeSerializer.new(current_user)
    else
      render json: {
        error: "No one logged in"
      }
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "successfully logged out"
    }, status: :ok
  end

end