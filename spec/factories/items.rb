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

FactoryGirl.define do
  factory :item do
    title Faker::Name.title
    list
  end
end
