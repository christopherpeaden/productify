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

require 'rails_helper'

RSpec.describe List do

  let(:list) { build(:list) }

  describe "validation" do

    it "has a valid factory" do
      expect(list).to be_valid
    end 

    context "invalid" do
      it "has a blank title" do
        list.title = ""
        expect(list).to be_invalid
      end

      it "has a duplicate title" do
        list.save
        duplicate_list = build(:list, title: list.title)
        expect(duplicate_list.save).to be false
      end
    end
  end

  describe "associations" do
    it { should respond_to(:category) }
    it { should respond_to(:items) }
  end
end
