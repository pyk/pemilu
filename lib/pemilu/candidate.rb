module Pemilu
	class Candidate
		attr_reader :id, :name, :gender, :religion, :birthplace, :date_of_birth, :marital_status, :name_of_couples, :number_of_children, :village, :sub_district, :district, :province, :electoral_district, :election_year, :legislative_body, :party, :ordinal, :picture, :educations, :jobs, :organizations

		def initialize( id: nil, name: nil, gender: nil, religion: nil, birthplace: nil, date_of_birth: nil, marital_status: nil, name_of_couples: nil, number_of_children: nil, village: nil, sub_district: nil, district: nil, province: nil, electoral_district: nil, election_year: nil, legislative_body: nil, party: nil, ordinal: nil, picture: nil, educations: nil, jobs: nil, organizations: nil)
		  
		  @id = id 
		  @name = name
      @gender = gender
      @religion = religion
      @birthplace = birthplace
      @date_of_birth = date_of_birth 
      @marital_status = marital_status 
      @name_of_couples = name_of_couples 
      @number_of_children = number_of_children
      @village = village 
      @sub_district = sub_district 
      @district = district 
      @province = province
      @electoral_district = electoral_district
      @election_year = election_year 
      @legislative_body = legislative_body
      @party = party
      @ordinal = ordinal
      @picture = picture
      @educations = educations
      @jobs = jobs
      @organizations = organizations
		end
	end
end