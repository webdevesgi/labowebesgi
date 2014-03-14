class Event < ActiveRecord::Base

  validates :title, presence: true

  has_many :talks, dependent: :nullify, validate: :false
  has_many :subscribtions
  has_many :subscribers, through: :subscribtions

  def self.past
    delay = 3.hours
    utc_offset = 1
    zone = ActiveSupport::TimeZone[utc_offset].name
    ago = delay.ago.in_time_zone(zone)
    events = self.where('starts_at <= :start_date', { start_date: ago })
    events
  end

  def self.next
    self.includes(subscribers: [], talks: [:speaker])
        .where('starts_at > ?', DateTime.now)
        .order('starts_at ASC')
        .limit(1)
        .first
  end

end
