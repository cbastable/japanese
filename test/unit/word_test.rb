# == Schema Information
#
# Table name: words
#
#  id          :integer          not null, primary key
#  word        :string(255)
#  reading     :string(255)
#  translation :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class WordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
