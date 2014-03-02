require "spec_helper"

module Pemilu
  describe API do
    describe "new" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should an object" do
        pemilu.should be_a(Object)
      end

    end

    describe "#key" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return 06ec082d057daa3d310b27483cc3962e" do
        expect(pemilu.key).to eq("06ec082d057daa3d310b27483cc3962e")
      end
    end

    describe "#candidates" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return an array of Pemilu::Candidate object" do
        pemilu.candidates.should be_a(Array)
        pemilu.candidates.each do |candidate|
          expect(candidate.class).to eq(Pemilu::Candidate)
        end
      end
    end

    describe "#candidate(id)" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return one Pemilu::Candidate object and correct details" do
        caleg = pemilu.candidate("1101-00-0000-0102")
        caleg.should be_a(Pemilu::Candidate)
        expect(caleg.id).to eq("1101-00-0000-0102")
        expect(caleg.name).to eq("Drs. H. T. PRIBADI")
        expect(caleg.gender).to eq("L")
        expect(caleg.religion).to eq("ISLAM")
        expect(caleg.birthplace).to eq("BANDA ACEH")
        expect(caleg.date_of_birth).to eq("1950-01-19")
        expect(caleg.marital_status).to eq("KAWIN")
        expect(caleg.name_of_couples).to eq("CUT MUSRI")
        expect(caleg.number_of_children).to eq(3)
        expect(caleg.village).to eq("GEUCEU INIEM")
        expect(caleg.sub_district).to eq("BANDA RAYA")
        expect(caleg.district).to eq("KOTA BANDA ACEH")
        expect(caleg.province.id).to eq(11)
        expect(caleg.province.name).to eq("Aceh")
        expect(caleg.electoral_district.id).to eq("1101-00-0000")
        expect(caleg.electoral_district.name).to eq("Aceh I")
        expect(caleg.election_year).to eq(2014)
        expect(caleg.legislative_body).to eq("DPR")
        expect(caleg.party.id).to eq(1)
        expect(caleg.party.name).to eq("Partai NasDem")
        expect(caleg.ordinal).to eq(2)
        expect(caleg.picture).to eq("http://dct.kpu.go.id/images/foto/DPR/1101.%20ACEH%20I/01.%20NASDEM/02.%20DRS.%20H.T.%20PRIBADI.JPG")
        expect(caleg.educations.class).to eq(Array)
        expect(caleg.jobs.class).to eq(Array)
        expect(caleg.organizations.class).to eq(Array)
      end
    end

    describe "#parties" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return an array of Pemilu::Party object" do
        pemilu.parties.should be_a(Array)
        pemilu.parties.each do |party|
          expect(party.class).to eq(Pemilu::Party)
        end
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
    end

    describe "#provinces" do
      let(:pemilu) { Pemilu::API.new(key: "06ec082d057daa3d310b27483cc3962e") }

      it "should return an array of Pemilu::Province object" do
        pemilu.provinces.should be_a(Array)
        pemilu.provinces.each do |province|
          expect(province.class).to eq(Pemilu::Province)
        end
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
    end

  end
end
