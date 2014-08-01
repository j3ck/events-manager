class Tag < ActiveRecord::Base
	searchkick

	has_many :tagships
	has_many :events, through: :tagships

	def self.tokens(query)
	    tags = where("name like ?", "%#{query}%")
	    if tags.empty?
	      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
	    else
	      tags
	    end
	  end

	  def self.ids_from_tokens(tokens)
	    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
	    tokens.split(',')
	  end
end
