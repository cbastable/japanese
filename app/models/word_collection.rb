# == Schema Information
#
# Table name: word_collections
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  word_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WordCollection < ActiveRecord::Base
  attr_accessible :collection_id, :word_id

  belongs_to :word
  belongs_to :collection

  validates_uniqueness_of :word_id, scope: :collection_id
  validates :word_id, presence: true
  validates :collection_id, presence: true
  #validates :word_id, presence: true, uniqueness: true <<<=== not this, will need to extend 
  	#words into all lower collections later
end
