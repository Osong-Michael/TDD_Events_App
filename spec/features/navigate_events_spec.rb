require 'rails_helper'

describe "Navigating events" do
  it "it allows navigation from the details page to the listing page" do
    event = Event.create(event_attributes)

    visit event_url(event)

    click_link "All Events"
    expect(current_path).to eq(events_path)  
  end

  it "it allows navigation from the listing page to the details page" do
    event = Event.create(event_attributes)

    visit events_url

    click_link event.name

    expect(current_url).to eq(event_url(event))  
  end
  
end
