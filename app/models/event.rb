class Event < ActiveRecord::Base

	geocoded_by :place
	after_validation :geocode

	belongs_to :user
	has_many :participations
	has_many :categorizations
	has_many :categories, through: :categorizations
	has_many :photos
	has_many :tagships
	has_many :tags, through: :tagships
	has_many :comments
	has_many :tracks
	attr_reader :tag_tokens

	def tag_tokens=(tokens)
		self.tag_ids = Tag.ids_from_tokens(tokens)
	end
end
