require 'rails_helper'

describe 'Viewing an individual Event' do
  it "shows the event's details" do
    event = Event.create(event_attributes(price: 15.0))

    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.location)
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.starts_at)
  end

  it "shows the price if the price is not $0" do
    event = Event.create(event_attributes(price: 25.0))

    visit event_url(event)

    expect(page).to have_text("$25.0")
  end
  it "shows 'Free' if the price is $0" do
    event = Event.create(event_attributes(price: 0.0))

    visit event_url(event)

    expect(page).to have_text("Free")
  end
end