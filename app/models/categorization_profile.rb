class CategorizationProfile < ActiveRecord::Base
	belongs_to :category
	belongs_to :profile
end
