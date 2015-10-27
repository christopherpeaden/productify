require 'rails_helper'

RSpec.describe Item do

  describe "validation" do

    subject { build(:item) }
    let(:item) { subject }

    it { should be_valid }

    it "rejects blank title" do
      item.title = ""
      expect(item).to_not be_valid
    end
  end

  describe "available messages" do
    it { should respond_to(:list) }
  end

end
