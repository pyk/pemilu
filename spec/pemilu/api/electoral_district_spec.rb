require "spec_helper"

module Pemilu
  describe API do
    describe "#electoral_districts" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return an array of Pemilu::ElectoralDistrict object" do
        pemilu.electoral_districts.should be_a(Array)
        pemilu.electoral_districts.each do |ed|
          expect(ed.class).to eq(Pemilu::ElectoralDistrict)
        end
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.electoral_districts).to eq("Invalid request error. Please check your API key")
      end
    end

    describe "#electoral_district(id)" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return Pemilu::ElectoralDistrict object and have correct details" do
        electoral_district = pemilu.electoral_district("1101-00-0000")
        electoral_district.should be_a(Pemilu::ElectoralDistrict)
        expect(electoral_district.id).to eq("1101-00-0000")
        expect(electoral_district.name).to eq("Aceh I")
        expect(electoral_district.legislative_body).to eq("DPR")
        expect(electoral_district.available_chairs).to eq(7)
        expect(electoral_district.population).to eq(2642760)
        electoral_district.province.should be_a(Hash)
        expect(electoral_district.province.id).to eq(11)
        expect(electoral_district.province.name).to eq("Aceh")
      end

      it "should return Can't get Electoral District with id: S" do
        expect(pemilu.electoral_district("S")).to eq( "Can't get Electoral District with id: S" )
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.electoral_district("1101-00-0000")).to eq("Invalid request error. Please check your API key")
      end

    end

  end
end
