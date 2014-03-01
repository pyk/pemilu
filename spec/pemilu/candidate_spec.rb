require "spec_helper"

module Pemilu
	describe Candidate do
		describe "new" do
			let(:candidate) { Pemilu::Candidate.new(
				id: 1,
        name: "bayu aldi yansyah",
        gender: "L",
        religion: "ISLAM",
        birthplace: "Nganjuk", 
        date_of_birth: "07 Oktober 1996", 
        marital_status: "Di PHPin", 
        name_of_couples: "Pevita Pearce", 
        number_of_children: 100, 
        village: "Keloposepuluh", 
        sub_district: "Sukodono", 
        district: "Sidoarjo", 
        province: {
          "id" => 2, 
          "name" => "Jawa Timur"
          },
        electoral_district: {
          "id" => 20,
          "name" => "Sidoarjo"
          },
        election_year: 2014, 
        legislative_body: "DPR",
        party: "Partai Asolole jos!",
        ordinal: 1,
        picture: "hhtp://foto.jpg",
        educations: [{
					"id" => 9,
					"ringkasan" => "Test"
				}],
        jobs: [{
					"id" => 9,
					"ringkasan" => "Test"
				}],
        organizations: [{
					"id" => 9,
					"ringkasan" => "Test"
				}] ) }

			it "should return a correct candidate details" do
				expect(candidate.id).to eq(1)
				expect(candidate.name).to eq("bayu aldi yansyah")
				expect(candidate.gender).to eq("L")
				expect(candidate.religion).to eq("ISLAM")
				expect(candidate.birthplace).to eq("Nganjuk")
				expect(candidate.date_of_birth).to eq("07 Oktober 1996")
				expect(candidate.marital_status).to eq("Di PHPin")
				expect(candidate.name_of_couples).to eq("Pevita Pearce")
				expect(candidate.number_of_children).to eq(100)
				expect(candidate.number_of_children).to eq(100)
				expect(candidate.village).to eq("Keloposepuluh")
				expect(candidate.sub_district).to eq("Sukodono")
				expect(candidate.district).to eq("Sidoarjo")
				expect(candidate.province.id).to eq(2)
				expect(candidate.province.name).to eq("Jawa Timur")
				expect(candidate.electoral_district.id).to eq(20)
				expect(candidate.electoral_district.name).to eq("Sidoarjo")
				expect(candidate.election_year).to eq(2014)
				expect(candidate.legislative_body).to eq("DPR")
				expect(candidate.party).to eq("Partai Asolole jos!")
				expect(candidate.ordinal).to eq(1)
				expect(candidate.picture).to eq("hhtp://foto.jpg")
				expect(candidate.educations.class).to eq(Array)
        expect(candidate.jobs.class).to eq(Array)
        expect(candidate.organizations.class).to eq(Array)
			end

		end
	end
end