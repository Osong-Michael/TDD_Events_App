class Event < ApplicationRecord
  def free?
    price.blank? || price.zero?    
  end

  def self.upcoming
    where('starts_at >= ?', Time.now).order('starts_at')
  end
end
