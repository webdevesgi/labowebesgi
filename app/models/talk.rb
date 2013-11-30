class Talk < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :event, validate: true
  validates :event, presence: true

  belongs_to :speaker, class_name: 'User', foreign_key: 'user_id', validate: true
  validates :speaker, presence: true
end
