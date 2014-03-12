require "spec_helper"

module Pemilu
  describe ElectoralDistrict do
    describe "new" do
      let(:ed) { Pemilu::ElectoralDistrict.new(
        id: 1,
        full_name: "test",
        legislative_body: "test",
        available_chairs: 1,
        population: 1,
        province: {
        "id" => 1,
        "name" => "test"
      })}

      it "should become Pemilu::ElectoralDistrict object and have correct details" do
        ed.should be_a(Pemilu::ElectoralDistrict)
        expect(ed.id).to eq(1)
        expect(ed.full_name).to eq("test")
        expect(ed.legislative_body).to eq("test")
        expect(ed.available_chairs).to eq(1)
        expect(ed.population).to eq(1)
        ed.province.should be_a(Hash)
        expect(ed.province["id"]).to eq(1)
        expect(ed.province["name"]).to eq("test")
      end
    end
  end
end
