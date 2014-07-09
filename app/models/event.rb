class Event < ActiveRecord::Base

	geocoded_by :place
	after_validation :geocode

	has_one :playlist
	belongs_to :user
	has_many :participations
	has_many :categorizations
	has_many :categories, through: :categorizations
	has_many :photos
	has_many :tagships
	has_many :tags, through: :tagships
	has_many :comments
	attr_reader :tag_tokens

	def tag_tokens=(tokens)
		self.tag_ids = Tag.ids_from_tokens(tokens)
	end

	after_create :add_playlist

	private
		def add_playlist
			self.build_playlist.save
		end
end
