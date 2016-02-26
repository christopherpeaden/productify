require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:item) { build(:item) }

  describe "POST #create" do
    context "valid" do
      it "creates a new item" do
        post :create, item: attributes_for(:item), list_id: item.list, category_id: item.list.category
        expect(Item.count).to eq 1
      end

      it "redirects to new item" do
        post :create, item: attributes_for(:item), list_id: item.list, category_id: item.list.category, id: 1
        expect(response).to redirect_to category_list_url(category, list, item)
      end
    end

    context "invalid" do
      it "does not create a new item" do
        post :create, item: attributes_for(:item, content: nil), list_id: item.list, category_id: item.list.category
        expect(Item.count).to eq 0
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the item" do
      item.save
      delete :destroy, id: item, list_id: item.list, category_id: item.list.category
      expect(Item.count).to eq 0 
    end
  end
end
