require 'rails_helper'

describe Admin::ProductsController do
  describe "POST create" do
    context "with valid input" do
      
      before do
        post :create, product: attributes_for(:product)
      end

      it "creates a new product" do
        expect(Product.count).to eq(1)
      end

      it "redirects to the admin products page" do
        expect(response).to redirect_to admin_products_path
      end

      it "sets the flash success message" do
        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid input" do

      before do
        post :create, product: attributes_for(:product, title: nil)
      end

      it "does not create a product" do
        expect(Product.count).to eq(0)
      end

      it "renders the new template" do
        expect(response).to render_template :new
      end

      it "sets the flash alert message" do
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "PATCH#update" do
    let(:product) { create(:product) }

    context "with valid input" do

      before do
        patch :update, id: product.id, product: { title: "new title" }
      end

      it "updates a product" do
        product.reload

        expect(Product.find(product.id).title).to eq("new title")
      end

      it "sets a flash success message" do
        expect(flash[:notice]).to be_present
      end

      it "redirects to the products page" do
        expect(response).to redirect_to admin_products_path
      end
    end

    context "with invalid input" do

      before do
        patch :update, id: product.id, product: { title: ""}
      end

      it "does not update a product" do
        product.reload

        expect(Product.find(product.id).title).not_to eq("")
      end

      it "renders the edit page" do
        expect(response).to render_template :edit
      end

      it "sets a flash alert message" do
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "DELETE#destroy" do
    let(:product) { create(:product) }

    before do
      delete :destroy, id: product.id
    end

    it "deletes the product" do
      expect(Product.count).to eq(0)
    end

    it "redirects to the products page" do
      expect(response).to redirect_to admin_products_path
    end

    it "sets the flash message" do
      expect(flash[:notice]).to be_present
    end
  end
end
