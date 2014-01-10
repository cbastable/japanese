# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  permalink  :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :title, :permalink, :content
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true

  #default_scope order: 'microposts.created_at DESC'
end
