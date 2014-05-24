class Event < ActiveRecord::Base
	has_many :participations
	belongs_to :user
	has_many :categorizations
	has_many :categories, through: :categorizations
end
