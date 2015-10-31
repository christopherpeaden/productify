# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#  category_id :integer
#

FactoryGirl.define do
  factory :list do
    title Faker::Name.title
    category
  end
end
