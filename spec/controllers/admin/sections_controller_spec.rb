require 'rails_helper'

describe Admin::SectionsController do
  describe "POST#create" do
    context "with valid input" do
      before do
        post :create, section: attributes_for(:section)
      end

      it "creates a new section" do
        expect(Section.count).to eq(1)
      end

      it "redirects to the admin sections page" do
        expect(response).to redirect_to admin_sections_path
      end

      it "sets the flash success message" do
        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid input" do

      before do
        post :create, section: attributes_for(:section, title: nil)
      end

      it "does not create a section" do
        expect(Section.count).to eq(0)
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
    let(:section) { create(:section) }

    context "with valid input" do

      before do
        patch :update, id: section.id, section: { title: "new title" }
      end

      it "updates a section" do
        section.reload

        expect(Section.find(section.id).title).to eq("new title")
      end

      it "sets a flash success message" do
        expect(flash[:notice]).to be_present
      end

      it "redirects to the admin sections page" do
        expect(response).to redirect_to admin_sections_path
      end
    end

    context "with invalid input" do

      before do
        patch :update, id: section.id, section: { title: "" }
      end

      it "does not update a section" do
        section.reload

        expect(Section.find(section.id).title).not_to eq("")
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
    let(:section) { create(:section) }

    before do
      delete :destroy, id: section.id
    end

    it "deletes the section" do
      expect(Section.count).to eq(0)
    end

    it "redirects to the admin section page" do
      expect(response).to redirect_to admin_sections_path
    end

    it "sets the flash message" do
      expect(flash[:notice]).to be_present
    end
  end
end
