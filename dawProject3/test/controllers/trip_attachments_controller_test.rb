require 'test_helper'

class TripAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_attachment = trip_attachments(:one)
  end

  test "should get index" do
    get trip_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_attachment_url
    assert_response :success
  end

  test "should create trip_attachment" do
    assert_difference('TripAttachment.count') do
      post trip_attachments_url, params: { trip_attachment: { photo: @trip_attachment.photo, trip_id: @trip_attachment.trip_id } }
    end

    assert_redirected_to trip_attachment_url(TripAttachment.last)
  end

  test "should show trip_attachment" do
    get trip_attachment_url(@trip_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_attachment_url(@trip_attachment)
    assert_response :success
  end

  test "should update trip_attachment" do
    patch trip_attachment_url(@trip_attachment), params: { trip_attachment: { photo: @trip_attachment.photo, trip_id: @trip_attachment.trip_id } }
    assert_redirected_to trip_attachment_url(@trip_attachment)
  end

  test "should destroy trip_attachment" do
    assert_difference('TripAttachment.count', -1) do
      delete trip_attachment_url(@trip_attachment)
    end

    assert_redirected_to trip_attachments_url
  end
end
