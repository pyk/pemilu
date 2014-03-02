module Pemilu
  class Province

    attr_reader :id, :name, :full_name, :international_name, :available_chairs, :population

    def initialize(id: nil, name: nil, full_name: nil, international_name: nil, available_chairs: nil, population: nil)
      @id = id
      @name = name
      @full_name = full_name
      @international_name = international_name
      @available_chairs = available_chairs
      @population = population
    end

  end
end
