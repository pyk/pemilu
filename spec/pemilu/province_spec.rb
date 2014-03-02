require "spec_helper"

module Pemilu
  describe Province do
    describe "new" do
      let(:province) { Pemilu::Province.new(
        id: 1,
        name: "Sidoarjo",
        full_name: "Sidoarjo",
        international_name: "Sidoarjo jos!",
        available_chairs: 1,
        population: 100000
      ) }

      it "should an object of Pemilu::Province and return correct details" do
        expect(province.class).to eq(Pemilu::Province)
        expect(province.id).to eq(1)
        expect(province.name).to eq("Sidoarjo")
        expect(province.full_name).to eq("Sidoarjo")
        expect(province.international_name).to eq("Sidoarjo jos!")
        expect(province.available_chairs).to eq(1)
        expect(province.population).to eq(100000)
      end
    end
  end
end
