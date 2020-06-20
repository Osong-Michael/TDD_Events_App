require 'rails_helper'

describe 'Viewing an individual Event' do
  it "shows the event's details" do
    event = Event.create(event_attributes(price: 15.0))

    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.location)
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.starts_at)
    expect(page).to have_text('$15.0')
  end
end