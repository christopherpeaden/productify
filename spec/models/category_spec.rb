require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category) { build(:category_with_lists) }

  describe "validations" do

    it "is valid" do
      expect(category).to be_valid
    end

    it "cannot have a blank title" do
      category.title = ""
      expect(category).to_not be_valid
    end
  end

  describe "receives a message" do
    
    it "responds to title" do
      expect(category).to respond_to(:title)
    end

    it "responds to lists" do
      expect(category).to respond_to(:lists)
    end
  end

  describe "relationships" do

    it "has many lists" do
      expect(category.lists.count).to be > 0
    end
  end

end
