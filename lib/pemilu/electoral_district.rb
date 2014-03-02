module Pemilu
  class ElectoralDistrict

    attr_reader :id, :name, :full_name, :legislative_body, :available_chairs, :population, :province

    def initialize(id: nil, name: nil, full_name: nil, legislative_body: nil, available_chairs: nil, population: nil, province: nil)
      @id = id
      @name = name
      @full_name = full_name
      @legislative_body = legislative_body
      @available_chairs = available_chairs
      @population = population
      @province = province
    end

  end
end
