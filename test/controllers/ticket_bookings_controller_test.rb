require "test_helper"

class TicketBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_booking = ticket_bookings(:one)
  end

  test "should get index" do
    get ticket_bookings_url, as: :json
    assert_response :success
  end

  test "should create ticket_booking" do
    assert_difference("TicketBooking.count") do
      post ticket_bookings_url, params: { ticket_booking: { customer_id: @ticket_booking.customer_id, event_date: @ticket_booking.event_date, event_id: @ticket_booking.event_id, status: @ticket_booking.status, ticket_id: @ticket_booking.ticket_id } }, as: :json
    end

    assert_response :created
  end

  test "should show ticket_booking" do
    get ticket_booking_url(@ticket_booking), as: :json
    assert_response :success
  end

  test "should update ticket_booking" do
    patch ticket_booking_url(@ticket_booking), params: { ticket_booking: { customer_id: @ticket_booking.customer_id, event_date: @ticket_booking.event_date, event_id: @ticket_booking.event_id, status: @ticket_booking.status, ticket_id: @ticket_booking.ticket_id } }, as: :json
    assert_response :success
  end

  test "should destroy ticket_booking" do
    assert_difference("TicketBooking.count", -1) do
      delete ticket_booking_url(@ticket_booking), as: :json
    end

    assert_response :no_content
  end
end
