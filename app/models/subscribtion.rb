class Subscribtion < ActiveRecord::Base
  belongs_to :subscribers, class_name: 'User', foreign_key: 'user_id'
  belongs_to :events_subscribed, class_name: 'Event', foreign_key: 'event_id'
end
