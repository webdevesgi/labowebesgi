class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :nullify, validate: :false
  has_many :talks, dependent: :nullify, validate: :false

  def admin?
    self.has_role?(:admin)
  end
end
