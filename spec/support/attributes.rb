def event_attributes(overrides ={})
  {
    name: 'Dev-Ops Limbe',
    location: 'Isokolo',
    price: 15.0,
    description: 'You damn good gotta be there',
    starts_at: 30.days.from_now
}.merge(overrides)
end

def registration_attributes(overrides = {})
  {
    name: "Joe Developer", 
    email: "joe@gmail.com",
    how_heard: "Twitter"     
  }.merge(overrides)
end
