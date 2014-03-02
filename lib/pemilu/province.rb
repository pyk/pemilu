module Pemilu
  class Province

    attr_reader :id, :name, :full_name, :international_name, :available_chairs, :population, :electoral_district

    def initialize(id: nil, name: nil, full_name: nil, international_name: nil, available_chairs: nil, population: nil, electoral_district: nil)
      @id = id
      @name = name
      @full_name = full_name
      @international_name = international_name
      @available_chairs = available_chairs
      @population = population
      @electoral_district = electoral_district
    end

  end
end
