require 'rails_helper'

describe "Deleting an event" do 
  it "destroys the event and shows the event listing" do
    event1 = Event.create(event_attributes)

    visit event_path(event1)
    
    click_link 'Delete'
    sleep(2)
    
    expect(current_url).to eq(events_url)
    expect(page).not_to have_text(event1.location)
    expect(page).to have_text("Event #{event1.name} deleted succesfully")
  end
end
