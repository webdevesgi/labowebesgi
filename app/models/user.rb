class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :nullify, validate: :false
  has_many :talks, dependent: :nullify, validate: :false
  has_many :subscribtions
  has_many :events_subscribed, through: :subscribtions

  def admin?
    self.has_role?(:admin)
  end

  def subscribed_to_event?(event)
    self.events_subscribed.include?(event)
  end

  def full_name
    "#{self.firstname} #{self.lastname}"
  end
end
