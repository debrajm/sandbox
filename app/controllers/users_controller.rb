class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save

      payload = {user_id: @user.id}
      token = create_token(payload)
      if @user.is_organiger
        @event_organiger = EventOrganiger.new(event_organiger_params)
        @event_organiger.save
      else
        @customer = Customer.new(customer_params)
        @customer.save
      end

      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :is_organiger)
    end

    def event_organiger_params
      params.require(:event_organiger).permit(:name, :email, :contact_person, :phone_no).merge(:user_id => @user.id)
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :address, :phone_no).merge(:user_id => @user.id)
    end
end
