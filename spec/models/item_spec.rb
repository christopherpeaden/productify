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
      it "has blank content" do
        item.content = ""
        expect(item).to be_invalid
      end
    end
  end

  describe "associations" do
    it { should respond_to(:list) }
  end
end
