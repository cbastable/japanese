# == Schema Information
#
# Table name: lists
#
#  id            :integer          not null, primary key
#  kanji_id      :integer
#  collection_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class List < ActiveRecord::Base
  attr_accessible :kanji_id, :collection_id

  belongs_to :kanji
  belongs_to :collection

  validates :kanji_id, presence: true
  validates :collection_id, presence: true
end
