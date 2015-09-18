class Category < ActiveRecord::Base
  has_many :lists
  validates :title, presence: true
end
