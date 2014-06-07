class Event < ActiveRecord::Base
	has_many :participations
	belongs_to :user
	has_many :categorizations
	has_many :categories, through: :categorizations

	has_many :tagships
	has_many :tags, through: :tagships
	attr_reader :tag_tokens

	def tag_tokens=(tokens)
		self.tag_ids = Tag.ids_from_tokens(tokens)
	end
end
