class List < ActiveRecord::Base
  belongs_to :category
  has_many :items
  validates :title, presence: true
end
