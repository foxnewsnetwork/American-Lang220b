class Ad < ActiveRecord::Base
# The corporations make ads.. although eventually we ought to make it so that
	# users can easily change their accounts to corporation level

  # Validations
  validates :corporation_id, :presence => true

  # Accessible traits
  attr_accessible :content, :photo

  # Setting the statistics table to be shared with the user
  has_many :adstats, :foreign_key => "ad_id", :dependent => :destroy
  has_many :users, :through => :adstats, :source => :ad_id

  belongs_to :corporation
  has_attached_file :photo, :styles => {:small => "100x100#", :large => "500x500>"},
                      :processors => [:cropper],
                      :url => "/assets/ads/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/ads/:id/:style/:basename.:extension"



  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
    after_update :reprocess_photo, :if => :cropping?

   def cropping?
       !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
   end

   def photo_geometry(style = :original)
     @geometry ||= {}
     @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))
   end

   private

   def reprocess_photo
     photo.reprocess!
   end
end
