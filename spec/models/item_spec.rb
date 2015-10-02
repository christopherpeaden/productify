require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:item) { build(:item) }

  describe "validations" do

    it "is valid" do
      expect(item).to be_valid
    end

    it "cannot have a blank title" do
      item.title = ""
      expect(item).to_not be_valid
    end
  end

  describe "available messages" do
    it "responds to title" do
      expect(item).to respond_to(:title)
    end

    it "responds to list" do
      expect(item).to respond_to(:list)
    end
  end

end
