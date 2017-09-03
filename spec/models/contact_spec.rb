require 'rails_helper'

describe Contact do
  describe "validations" do

    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(email: "DragonMommy16@gmail.com", position: "Way too long to list")
        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        contact = Contact.new(name: "Danaerys Stormborn", position: "Way too long to list")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(name: "Danaerys Stormborn", email: "DragonMommy16@gmail.com")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        contact = create(:contact)
        expect(contact).to be_valid
      end
    end

    describe "relationships" do
      it "belongs to a company" do
        contact = create(:contact)
        expect(contact).to respond_to(:company)
      end
    end
  end
end
