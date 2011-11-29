class Adstat < ActiveRecord::Base
	attr_accessible :ad_id , :user_id , :views , :clicks , :closes
	
	belongs_to :ad, :class_name => "Ad"
	belongs_to :user, :class_name => "User"
	
	validates :ad_id, :presence => true
	validates :user_id, :presence => true
end
