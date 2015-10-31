require 'rails_helper'

RSpec.describe Item do

  let(:item) { build(:item) }

  describe "validation" do

    it "has a valid factory" do
      expect(item).to be_valid
    end 

    it "rejects blank title" do
      item.title = ""
      expect(item).to_not be_valid
    end
  end

  describe "associations" do
    it { should respond_to(:list) }
  end

end
