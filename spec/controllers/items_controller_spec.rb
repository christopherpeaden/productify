require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:item) { create(:item) }

  describe "GET #new" do
    it "renders the new item form" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "valid" do
      it "creates a new item" do
        post :create, item: attributes_for(:item)
        expect(Item.count).to eq 1
      end

      it "redirects to new item" do
        post :create, item: attributes_for(:item)
        expect(response).to redirect_to Item.first
      end
    end

    context "invalid" do
      it "does not create a new feed" do
        post :create, item: attributes_for(:item, title: nil)
        expect(Item.count).to eq 0
      end

      it "renders the new view" do
        post :create, item: attributes_for(:item, title: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #show" do
    it "renders show template" do
      get :show, id: item
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #index" do
    it "renders index template" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "#edit" do
    it "renders edit template" do
      get :edit, id: item
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end


  describe "PATCH #update" do
    it "changes item data" do
      put :update, id: item, item: attributes_for(:item, title: "New title")
      expect(Item.first.title).to_not eq item.title
    end
  end

  describe "DELETE #destroy" do
    it "deletes the item" do
      delete :destroy, id: item
      expect(Item.count).to eq 0 
    end
  end
end
