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

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.candidates).to eq("Invalid request error. Please check your API key")
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
        expect(caleg.picture).to eq("http://apipemilu-caleg.s3-website-ap-southeast-1.amazonaws.com/caleg/foto/DPR/1101.%20ACEH%20I/01.%20NASDEM/02.%20DRS.%20H.T.%20PRIBADI.jpg")
        expect(caleg.educations.class).to eq(Array)
        expect(caleg.jobs.class).to eq(Array)
        expect(caleg.organizations.class).to eq(Array)
      end

      it "should return Can't get Candidate with id: 1" do
        expect(pemilu.candidate(1)).to eq( "Can't get Candidate with id: 1" )
      end

      let(:pemilu_invalid) { Pemilu::API.new(key:"xxx") }

      it "should return invalid request error " do
        expect(pemilu_invalid.candidate("1101-00-0000-0102")).to eq("Invalid request error. Please check your API key")
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
