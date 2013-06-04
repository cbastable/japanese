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

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
