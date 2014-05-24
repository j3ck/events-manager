class User < ActiveRecord::Base

	has_many :events
	has_many :participations
	has_many :participant_events, through: :participations, source: "event"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
