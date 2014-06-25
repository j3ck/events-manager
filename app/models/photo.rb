class Photo < ActiveRecord::Base

	belongs_to :event

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "149x105" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
