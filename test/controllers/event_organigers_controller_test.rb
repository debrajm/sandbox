require "test_helper"

class EventOrganigersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_organiger = event_organigers(:one)
  end

  test "should get index" do
    get event_organigers_url, as: :json
    assert_response :success
  end

  test "should create event_organiger" do
    assert_difference("EventOrganiger.count") do
      post event_organigers_url, params: { event_organiger: { contact_person: @event_organiger.contact_person, email: @event_organiger.email, name: @event_organiger.name, phone_no: @event_organiger.phone_no } }, as: :json
    end

    assert_response :created
  end

  test "should show event_organiger" do
    get event_organiger_url(@event_organiger), as: :json
    assert_response :success
  end

  test "should update event_organiger" do
    patch event_organiger_url(@event_organiger), params: { event_organiger: { contact_person: @event_organiger.contact_person, email: @event_organiger.email, name: @event_organiger.name, phone_no: @event_organiger.phone_no } }, as: :json
    assert_response :success
  end

  test "should destroy event_organiger" do
    assert_difference("EventOrganiger.count", -1) do
      delete event_organiger_url(@event_organiger), as: :json
    end

    assert_response :no_content
  end
end
