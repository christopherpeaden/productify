require 'rails_helper'

RSpec.describe List do

  describe "validation" do

    subject { build(:list) }
    let(:list) { subject }

    it { should be_valid }

    it "rejects blank title" do
      list.title = ""
      expect(list).to_not be_valid
    end
  end

  describe "associations" do
    it { should respond_to(:category) }
    it { should respond_to(:items) }
  end
      
end
