require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  let(:list) { build(:list) }

  describe "GET #new" do
    it "renders the new list form" do
      get :new, category_id: list.category
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "valid" do
      it "creates a new list" do
        post :create, list: attributes_for(:list), category_id: list.category

        expect(List.count).to eq 1
      end

      it "redirects to new list" do
        post :create, list: attributes_for(:list), category_id: list.category

        expect(response).to redirect_to List.first
      end
    end

    context "invalid" do
      it "does not create a new feed" do
        post :create, list: attributes_for(:list, title: nil), category_id: list.category

        expect(List.count).to eq 0
      end

      it "renders the new view" do
        post :create, list: attributes_for(:list, title: nil), category_id: list.category

        expect(response).to render_template :new
      end
    end
  end

  describe "GET #show" do
    it "renders show template" do
      list.save
      get :show, id: list, category_id: list.category
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe "#edit" do
    it "renders edit template" do
      list.save
      get :edit, id: list, category_id: list.category
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end


  describe "PATCH #update" do
    it "changes list data" do
      list.save
      put :update, id: list, list: attributes_for(:list, title: "New title"), category_id: list.category
      expect(List.first.title).to_not eq list.title
    end
  end

  describe "DELETE #destroy" do
    it "deletes the list" do
      list.save
      delete :destroy, id: list, category_id: list.category
      expect(List.count).to eq 0 
    end
  end
end
