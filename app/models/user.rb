class User < ActiveRecord::Base
	has_many :comments
	has_one  :profile
	has_many :events
	has_many :participations
	has_many :participant_events, through: :participations, source: "event"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  after_create :add_profile

  private
  	def add_profile
  		self.build_profile.save
  	end
end
