class Profile < ActiveRecord::Base
	belongs_to :user

	has_many :categorization_profiles
	has_many :categories, through: :categorization_profiles

	has_attached_file :avatar, :styles => { :small => {:geometry => "200x200#", :processors => [:cropper]}, :large => {:geometry => "500x500>"} }, :default_url => "/missing.gif"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end
end
