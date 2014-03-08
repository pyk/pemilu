require "spec_helper"

module Pemilu
  describe API do
    describe "#parties" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return an array of Pemilu::Party object" do
        pemilu.parties.should be_a(Array)
        pemilu.parties.each do |party|
          expect(party.class).to eq(Pemilu::Party)
        end
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.parties).to eq("Invalid request error. Please check your API key")
      end
    end

    describe "#party(id)" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return Pemilu::Party object and have correct details" do
        party = pemilu.party(1)
        party.should be_a(Pemilu::Party)
        expect(party.id).to eq(1)
        expect(party.nick_name).to eq("Partai NasDem")
        expect(party.full_name).to eq("Partai NasDem")
        expect(party.url).to eq("http://www.partainasdem.org/")
        expect(party.facebook).to eq("https://www.facebook.com/pages/Partai-Nasdem/135724689838285")
        expect(party.twitter).to eq("https://twitter.com/NasDem")
      end

      it "should return Can't get Party with id: S" do
        expect(pemilu.party("S")).to eq( "Can't get Party with id: S" )
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.party(1)).to eq("Invalid request error. Please check your API key")
      end
    end

  end
end
