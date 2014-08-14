class Category < ActiveRecord::Base
	searchkick

	has_many :categorizations
	has_many :events, through: :categorizations

	has_many :categorization_profiles
	has_many :profiles, through: :categorization_profiles
end
