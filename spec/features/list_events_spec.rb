require 'rails_helper'

describe 'Viewing the list of Events' do
  it 'shows the event' do
    event1 = Event.create(name: 'Dev-Ops Limbe',
                          location: 'Isokolo',
                          price: 15.0,
                          description: 'You damn good gotta be there',
                          starts_at: 30.days.from_now)

    event2 = Event.create(name: 'Dev-Ops Buea',
                          location: 'Molyko',
                          price: 15.0,
                          description: 'You damn good gotta be there too',
                          starts_at: 60.days.from_now)

    event3 = Event.create(name: 'Dev-Ops Rozay',
                          location: 'Rozay-Palace',
                          price: 25.0,
                          description: 'Huuuuuuuhhhhhh Dude',
                          starts_at: 90.days.from_now)

    visit events_url

    expect(page).to have_text('3 Events')
    expect(page).to have_text(event1.name)
    expect(page).to have_text(event2.name)
    expect(page).to have_text(event3.name)

    expect(page).to have_text(event1.location)
    expect(page).to have_text(event2.description[0..10])
    expect(page).to have_text(event3.starts_at)
    expect(page).to have_text('$15.0')
  end
end