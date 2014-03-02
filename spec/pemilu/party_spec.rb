require "spec_helper"

module Pemilu
  describe Party do
    describe "new" do
      let(:party) { Pemilu::Party.new(
        id: 1,
        nick_name: "ASOLOLE",
        full_name: "ASOLOLE JOS!",
        url: "test",
        facebook: "test",
        twitter: "test"
      ) }

      it "should return Pemilu::Party object and have correct details" do
        party.should be_a(Pemilu::Party)
        expect(party.id).to eq(1)
        expect(party.nick_name).to eq("ASOLOLE")
        expect(party.full_name).to eq("ASOLOLE JOS!")
        expect(party.url).to eq("test")
        expect(party.facebook).to eq("test")
        expect(party.twitter).to eq("test")
      end
    end
  end
end
