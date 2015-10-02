require 'rails_helper'

RSpec.describe List, type: :model do

  let(:list) { build(:list) }

  describe "validations" do

    it "is valid" do
      expect(list).to be_valid
    end

    it "cannot have a blank title" do
      list.title = ""
      expect(list).to_not be_valid
    end
  end


  describe "available messages" do

    it "responds to title" do
      expect(list).to respond_to(:title)
    end

    it "responds to category" do
      expect(list).to respond_to(:category)
    end

    it "responds to items" do
      expect(list).to respond_to(:items)
    end
  end
      
end
