class Event < ActiveRecord::Base

  validates :title, presence: true

  def self.past
    delay = 3.hours
    utc_offset = 1
    zone = ActiveSupport::TimeZone[utc_offset].name
    ago = delay.ago.in_time_zone(zone)
    events = self.where("starts_at <= :start_date", {start_date: ago})
    events
  end
end
