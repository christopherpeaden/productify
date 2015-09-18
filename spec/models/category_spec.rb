require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category) { Category.create(title: "Category title") }

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

end
