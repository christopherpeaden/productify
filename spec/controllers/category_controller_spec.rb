require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:category) { create(:category) }

  describe "GET #new" do
    it "renders the new category form" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "valid" do
      it "creates a new category" do
        post :create, category: attributes_for(:category)
        expect(Category.count).to eq 1
      end

      it "redirects to new category" do
        post :create, category: attributes_for(:category)
        expect(response).to redirect_to Category.first
      end
    end

    context "invalid" do
      it "does not create a new feed" do
        post :create, category: attributes_for(:category, title: nil)
        expect(Category.count).to eq 0
      end

      it "renders the new view" do
        post :create, category: attributes_for(:category, title: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: category
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "#edit" do
    it "returns http success" do
      get :edit, id: category
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end


  describe "PATCH #update" do
    it "returns http success" do
      put :update, id: category, category: attributes_for(:category, title: "New title")
      expect(Category.first.title).to_not eq category.title
    end
  end

  describe "DELETE #destroy" do
    it "deletes the category" do
      delete :destroy, id: category
      expect(Category.count).to eq 0 
    end
  end
end
