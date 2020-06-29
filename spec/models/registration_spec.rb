require 'rails_helper'

describe "A registration" do
    
  it "belongs to an event" do
    event = Event.create(event_attributes)
    
    registration = event.registrations.new(registration_attributes)
        
    expect(registration.event).to eq(event)
  end
  
  it "requires a name" do
    registration = Registration.new(name: "")
    
    registration.valid? # populates errors
    
    expect(registration.errors[:name].any?).to eq(true)
  end

  it "requires an email" do
    registration = Registration.new(email: "")
    
    registration.valid?
    
    expect(registration.errors[:email].any?).to eq(true)
  end

  it "accepts properly formatted emails" do
    emails = %w[user@example.com USER@example.com first.last@example.com]
    emails.each do |email|
      registration = Registration.new(email: email)
      
      registration.valid?

      expect(registration.errors[:email].any?).to eq(false)
    end
  end
  
  it "reject improperly formatted emails" do
    emails = %w[user user_at_example.com @example.]
    emails.each do |email|
      registration = Registration.new(email: email)
      
      registration.valid?

      expect(registration.errors[:email].any?).to eq(true)
    end
  end
  
  it "accepts any how heard option that is in an approved list" do
    options = Registration::HOW_HEARD_OPTIONS
    options.each do |option|
      registration = Registration.new(how_heard: option)
      
      registration.valid?

      expect(registration.errors[:how_heard].any?).to eq(false)
    end
  end
  
  it "rejects any how heard option that is not in the approved list" do
    options = %w[foo bar baz]
    options.each do |option|
      registration = Registration.new(how_heard: option)
      
      registration.valid?

      expect(registration.errors[:how_heard].any?).to eq(true)
    end
  end
end

