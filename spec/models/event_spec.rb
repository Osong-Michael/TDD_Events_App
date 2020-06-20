require 'rails_helper'

describe "An Event" do
  it "Is free if event price is $0" do
    event = Event.new(price: 0.0)

    expect(event.free?).to eq(true)  
  end

  it "Is not free if event price is not $0" do
    event = Event.new(price: 10.0)

    expect(event.free?).to eq(false)  
  end

  it "Is free if event price is blank" do
    event = Event.new(price: nil)

    expect(event.free?).to eq(true)  
  end
end
