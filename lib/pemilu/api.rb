module Pemilu
  class API
    attr_reader :key

    def initialize(key: nil)
      @key = key
    end
  end
end
