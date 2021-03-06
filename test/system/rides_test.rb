require "application_system_test_case"

class RidesTest < ApplicationSystemTestCase
  setup do
    @ride = rides(:one)
  end

  test "visiting the index" do
    visit rides_url
    assert_selector "h1", text: "Rides"
  end

  test "creating a Ride" do
    visit rides_url
    click_on "New Ride"

    fill_in "Carno", with: @ride.carno
    fill_in "Cartype", with: @ride.cartype
    fill_in "Complete", with: @ride.complete
    fill_in "Customer", with: @ride.customer_id
    fill_in "Destination", with: @ride.destination
    fill_in "Driverphn", with: @ride.driverphn
    fill_in "Seats", with: @ride.seats
    fill_in "Seatsleft", with: @ride.seatsleft
    fill_in "Time", with: @ride.time
    click_on "Create Ride"

    assert_text "Ride was successfully created"
    click_on "Back"
  end

  test "updating a Ride" do
    visit rides_url
    click_on "Edit", match: :first

    fill_in "Carno", with: @ride.carno
    fill_in "Cartype", with: @ride.cartype
    fill_in "Complete", with: @ride.complete
    fill_in "Customer", with: @ride.customer_id
    fill_in "Destination", with: @ride.destination
    fill_in "Driverphn", with: @ride.driverphn
    fill_in "Seats", with: @ride.seats
    fill_in "Seatsleft", with: @ride.seatsleft
    fill_in "Time", with: @ride.time
    click_on "Update Ride"

    assert_text "Ride was successfully updated"
    click_on "Back"
  end

  test "destroying a Ride" do
    visit rides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ride was successfully destroyed"
  end
end
