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

require 'rails_helper'

RSpec.describe Item do

  let(:item) { build(:item) }

  describe "validation" do

    it "has a valid factory" do
      expect(item).to be_valid
    end 

    context "invalid" do
      it "has a blank title" do
        item.title = ""
        expect(item).to be_invalid
      end

      it "has a duplicate title" do
        item.save
        duplicate_item = build(:item, title: item.title)
        expect(duplicate_item.save).to be false
      end
    end
  end

  describe "associations" do
    it { should respond_to(:list) }
  end
end
