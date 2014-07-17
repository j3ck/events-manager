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

	def self.tagged_with(name)
	  Tag.find_by_name!(name).events
	end

	def self.tag_counts
	  Tag.select("tags.id, tags.name, count(tagships.tag_id) as count").
	        joins(:tagships).group("tagships.tag_id, tags.id, tags.name")
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
	end

	def tag_tokens=(tokens)
		self.tag_ids = Tag.ids_from_tokens(tokens)
	end

	after_create :add_playlist

	private
		def add_playlist
			self.build_playlist.save
		end
end
