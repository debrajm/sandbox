class TicketBookingsController < ApplicationController
  before_action :set_ticket_booking, only: %i[ show update destroy ]

  # GET /ticket_bookings
  def index
    @ticket_bookings = TicketBooking.all

    render json: @ticket_bookings
  end

  # GET /ticket_bookings/1
  def show
    render json: @ticket_booking
  end

  # POST /ticket_bookings
  def create
    @ticket_booking = TicketBooking.new(ticket_booking_params)

    if @ticket_booking.save
      render json: @ticket_booking, status: :created, location: @ticket_booking
    else
      render json: @ticket_booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ticket_bookings/1
  def update
    if @ticket_booking.update(ticket_booking_params)
      render json: @ticket_booking
    else
      render json: @ticket_booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ticket_bookings/1
  def destroy
    @ticket_booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_booking
      @ticket_booking = TicketBooking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_booking_params
      params.require(:ticket_booking).permit(:customer_id, :ticket_id, :event_id, :event_date, :status)
    end
end
