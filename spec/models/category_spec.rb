# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category do

  let(:category) { build(:category) }

  describe "validation" do

    it "has a valid factory" do
      expect(category).to be_valid
    end

    context "invalid" do
      it "has a blank title" do
        category.title = ""
        expect(category).to be_invalid
      end

      it "has a duplicate title" do
        category.save
        duplicate_category = build(:category, title: category.title)
        expect(duplicate_category.save).to be false
      end
    end
  end

  describe "associations" do
    it { should respond_to(:lists) }
  end
end
