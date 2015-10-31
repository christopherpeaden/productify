require 'rails_helper'

RSpec.describe Category do

  let(:category) { build(:category) }

  describe "validation" do

    it "has a valid factory" do
      expect(category).to be_valid
    end

    it "cannot have a blank title" do
      category.title = ""
      expect(category).to be_invalid
    end
  end

  describe "associations" do
    it { should respond_to(:lists) }
  end

end
