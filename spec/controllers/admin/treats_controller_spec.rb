require 'rails_helper'

describe Admin::TreatsController do
  describe "POST create" do
    context "with valid input" do
      it "creates a new treat" do
        post :create, treat: { title: "treat1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23 }
        expect(Treat.count).to eq(1)
      end

      it "redirects to the treats page" do
        post :create, treat: { title: "treat1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23 }

        expect(response).to redirect_to admin_treats_path
      end

      it "sets the flash success message" do
        post :create, treat: { title: "treat1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23 }

        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid input" do
      it "does not create a treat" do
        post :create, treat: { title: "treat1", tagline: "tagline1", summary: "summary1", description: "description1", price: "hello" }

        expect(Treat.count).to eq(0)
      end

      it "renders the new template" do
        post :create, treat: { title: "treat1", tagline: "tagline1", summary: "summary1", description: "description1", price: "hello" }

        expect(response).to render_template :new
      end

      it "sets the flash alert message" do
        post :create, treat: { title: "treat1", tagline: "tagline1", summary: "summary1", description: "description1", price: "hello" }

        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "PUT#update" do
    let(:treat) { Treat.create(title: "treat1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23) }

    context "with valid input" do
      it "updates a treat" do
        patch :update, id: treat.id, treat: { title: "new title" }
        treat.reload

        expect(Treat.find(treat.id).title).to eq("new title")
      end

      it "sets a flash success message" do
        patch :update, id: treat.id, treat: { title: "new title" }

        expect(flash[:notice]).to be_present
      end

      it "redirects to the treat page" do
        patch :update, id: treat.id, treat: { title: "new title" }

        expect(response).to redirect_to admin_treats_path
      end
    end

    context "with invalid input" do
      it "does not update a treat" do
        patch :update, id: treat.id, treat: { title: "" }

        expect(Treat.find(treat.id).title).not_to eq("")
      end

      it "renders the edit page" do
        patch :update, id: treat.id, treat: { title: "" }

        expect(response).to render_template :edit
      end

      it "sets a flash alert message" do
        patch :update, id: treat.id, treat: { title: "" }

        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    let(:treat) { Treat.create(title: "treat1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23) }

    it "deletes the treat" do
      delete :destroy, id: treat.id

      expect(Treat.count).to eq(0)
    end

    it "redirects to the treats page" do
      delete :destroy, id: treat.id

      expect(response).to redirect_to admin_treats_path
    end

    it "sets the flash message" do
      delete :destroy, id: treat.id

      expect(flash[:notice]).to be_present
    end
  end
end
