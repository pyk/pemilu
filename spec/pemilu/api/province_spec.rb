require "spec_helper"

module Pemilu
  describe API do
    describe "#provinces" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return an array of Pemilu::Province object" do
        pemilu.provinces.should be_a(Array)
        pemilu.provinces.each do |province|
          expect(province.class).to eq(Pemilu::Province)
        end
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.provinces).to eq("Invalid request error. Please check your API key")
      end
    end

    describe "#province(id)" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return Pemilu::Province object and have correct details" do
        province = pemilu.province(11)
        province.should be_a(Pemilu::Province)
        expect(province.id).to eq(11)
        expect(province.name).to eq("Aceh")
        expect(province.full_name).to eq("Aceh")
        expect(province.international_name).to eq("Special Region of Aceh")
        expect(province.available_chairs).to eq(13)
        expect(province.population).to eq(5015234)
        province.electoral_district.should be_a(Array)
      end

      it "should return Can't get Province with id: S" do
        expect(pemilu.province("S")).to eq( "Can't get Province with id: S" )
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.province(11)).to eq("Invalid request error. Please check your API key")
      end
    end


  end
end
