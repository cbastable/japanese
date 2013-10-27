# == Schema Information
#
# Table name: custom_lists
#
#  id                   :integer          not null, primary key
#  kanji_id             :integer
#  custom_collection_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class CustomList < ActiveRecord::Base
  attr_accessible :kanji_id, :custom_collection_id

  belongs_to :kanji
  belongs_to :custom_collection

  validates :kanji_id, presence: true
  validates :custom_collection_id, presence: true
end
