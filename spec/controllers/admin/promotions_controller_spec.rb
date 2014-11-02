require 'rails_helper'

describe Admin::PromotionsController do
  describe "POST create" do
    context "with valid input" do
      it "creates a new promotion" do
        post :create, promotion: { title: "promotion1", tagline: "this a tagline", description: "this is a description" }
        expect(Promotion.count).to eq(1) 
      end

      it "redirects to the promotions page" do
        post :create, promotion: { title: "promotion1", tagline: "this a tagline", description: "this is a description" }

        expect(response).to redirect_to admin_promotions_path
      end

      it "sets the flash success message" do
        post :create, promotion: { title: "promotion1", tagline: "this a tagline", description: "this is a description" }

        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid input" do
      it "does not create a promotion" do
        post :create, promotion: { title: "", tagline: "this a tagline", description: "this is a description" }

        expect(Promotion.count).to eq(0)
      end

      it "renders the new template" do
        post :create, promotion: { title: "", tagline: "this a tagline", description: "this is a description" }

        expect(response).to render_template :new
      end

      it "sets the flash alert message" do
        post :create, promotion: { title: "", tagline: "this a tagline", description: "this is a description" }

        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "PUT#update" do
    let(:promotion) { Promotion.create(title: "promotion1", tagline: "this is a tagline", description: "this is a description") } 

    context "with valid input" do
      it "updates an existing promotion" do
        patch :update, id: promotion.id, promotion: { title: "new title" }
        promotion.reload

        expect(Promotion.find(promotion.id).title).to eq("new title")
      end

      it "sets a flash success message" do
        patch :update, id: promotion.id, promotion: { title: "new title" }
        expect(flash[:notice]).to be_present
      end

      it "redirects to the promotions page" do
        patch :update, id: promotion.id, promotion: { title: "new title" }

        expect(response).to redirect_to admin_promotions_path
      end
    end

    context "with invalid input" do
      it "does not update a promotion" do
        patch :update, id: promotion.id, promotion: { title: "" }
        promotion.reload

        expect(Promotion.find(promotion.id).title).not_to eq("")
      end

      it "renders the edit page" do
        patch :update, id: promotion.id, promotion: { title: "" }

        expect(response).to render_template :edit
      end

      it "sets a flash alert message" do
        patch :update, id: promotion.id, promotion: { title: "" }

        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    let(:promotion) { Promotion.create(title: "promotion1", tagline: "this is a tagline", description: "this is a description") } 

    it "deletes the researcher" do
      delete :destroy, id: promotion.id

      expect(Promotion.count).to eq(0)
    end

    it "redirects to the promotions page" do
      delete :destroy, id: promotion.id

      expect(response).to redirect_to admin_promotions_path
    end

    it "sets the flash message" do
      delete :destroy, id: promotion.id

      expect(flash[:notice]).to be_present
    end
  end
end
