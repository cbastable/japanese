# == Schema Information
#
# Table name: custom_collections
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CustomCollection < ActiveRecord::Base
	attr_accessible :name

	belongs_to :user
	
	has_many :custom_lists, foreign_key: "custom_collection_id", dependent: :destroy
	has_many :kanjis, through: :custom_lists
	
	
end
