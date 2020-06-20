def event_attributes(overrides ={})
  {
    name: 'Dev-Ops Limbe',
    location: 'Isokolo',
    price: 15.0,
    description: 'You damn good gotta be there',
    starts_at: 30.days.from_now
}.merge(overrides)
end
