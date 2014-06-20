class Profile < ActiveRecord::Base
	belongs_to :user

	has_many :categorization_profiles
	has_many :categories, through: :categorization_profiles
end
