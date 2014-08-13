class Photo < ActiveRecord::Base

	belongs_to :event

	has_attached_file :photo, :styles => { :small => "100x100#" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
