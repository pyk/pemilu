module Pemilu
  class API
    def provinces
      uri = URI("http://api.pemiluapi.org/candidate/api/provinsi")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)
      result = []

      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      @total_provinsi = data["data"]["results"]["count"]
      provinces = data["data"]["results"]["provinsi"]
      provinces.each do |province|
        result << Pemilu::Province.new(
          id: province["id"].to_i,
          name: province["nama"],
          full_name: province["nama_lengkap"],
          international_name: province["nama_inggris"],
          available_chairs: province["jumlah_kursi"],
          population: province["jumlah_penduduk"])
      end
      return result
    end

    def province(id)
      uri = URI("http://api.pemiluapi.org/candidate/api/provinsi/#{id}")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)
      return "Can't get Province with id: #{id}" if respond.is_a?(Net::HTTPBadRequest)

      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      province = data["data"]["results"]["provinsi"][0]
      return Pemilu::Province.new(
          id: province["id"].to_i,
          name: province["nama"],
          full_name: province["nama_lengkap"],
          international_name: province["nama_inggris"],
          available_chairs: province["jumlah_kursi"],
          electoral_district: province["dapil"],
          population: province["jumlah_penduduk"])
    end

  end
end
