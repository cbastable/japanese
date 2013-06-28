# == Schema Information
#
# Table name: words
#
#  id          :integer          not null, primary key
#  word        :text
#  reading     :text
#  translation :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class WordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
