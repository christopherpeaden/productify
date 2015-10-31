# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  list_id    :integer
#

class Item < ActiveRecord::Base
  belongs_to :list
  validates :title, presence: true, uniqueness: true
end
