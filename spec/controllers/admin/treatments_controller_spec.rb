require 'rails_helper'

describe Admin::TreatmentsController do
  describe "POST create" do
    context "with valid input" do
      it "creates a new treat" do
        post :create, treatment: attributes_for(:treatment) 
        expect(Treatment.count).to eq(1)
      end

      it "redirects to the treats page" do
        post :create, treatment: attributes_for(:treatment) 

        expect(response).to redirect_to admin_treatments_path
      end

      it "sets the flash success message" do
        post :create, treatment: attributes_for(:treatment) 

        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid input" do
      it "does not create a treat" do
        post :create, treatment: attributes_for(:treatment, price: "hello") 

        expect(Treatment.count).to eq(0)
      end

      it "renders the new template" do
        post :create, treatment: attributes_for(:treatment, price: "hello") 

        expect(response).to render_template :new
      end

      it "sets the flash alert message" do
        post :create, treatment: attributes_for(:treatment, price: "hello") 

        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "PUT#update" do
    let(:treatment) { create(:treatment) }

    context "with valid input" do
      it "updates a treat" do
        patch :update, id: treatment.id, treatment: { title: "new title" }
        treatment.reload

        expect(Treatment.find(treatment.id).title).to eq("new title")
      end

      it "sets a flash success message" do
        patch :update, id: treatment.id, treatment: { title: "new title" }

        expect(flash[:notice]).to be_present
      end

      it "redirects to the treat page" do
        patch :update, id: treatment.id, treatment: { title: "new title" }

        expect(response).to redirect_to admin_treatments_path
      end
    end

    context "with invalid input" do
      it "does not update a treat" do
        patch :update, id: treatment.id, treatment: { title: "" }

        expect(Treatment.find(treatment.id).title).not_to eq("")
      end

      it "renders the edit page" do
        patch :update, id: treatment.id, treatment: { title: "" }

        expect(response).to render_template :edit
      end

      it "sets a flash alert message" do
        patch :update, id: treatment.id, treatment: { title: "" }

        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    let(:treatment) { create(:treatment) }

    it "deletes the treat" do
      delete :destroy, id: treatment.id

      expect(Treatment.count).to eq(0)
    end

    it "redirects to the treats page" do
      delete :destroy, id: treatment.id

      expect(response).to redirect_to admin_treatments_path
    end

    it "sets the flash message" do
      delete :destroy, id: treatment.id

      expect(flash[:notice]).to be_present
    end
  end
end
