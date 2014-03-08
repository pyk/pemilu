module Pemilu
  class API
    def electoral_districts(province: nil, legislative_body: nil)
      uri = URI("http://api.pemiluapi.org/candidate/api/dapil")
      params = {
        apiKey: @key,
        lembaga: legislative_body,
        provinsi: province
      }
      params.delete_if{ |k,v| v.nil? }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)
      result = []
      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      @total_election_districts = data["data"]["results"]["count"]
      eds = data["data"]["results"]["dapil"]
      eds.each do |ed|
        result << Pemilu::ElectoralDistrict.new(
          id: ed["id"],
          name: ed["nama"],
          full_name: ed["nama_lengkap"],
          legislative_body: ed["nama_lembaga"],
          available_chairs: ed["jumlah_kursi"],
          population: ed["jumlah_penduduk"],
          province: {
            "id" => ed["provinsi"]["id"],
            "name" => ed["provinsi"]["nama"]
          })
      end
      return result
    end

    def electoral_district(id)
      uri = URI("http://api.pemiluapi.org/candidate/api/dapil/#{id}")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)
      return "Can't get Electoral District with id: #{id}" if respond.is_a?(Net::HTTPInternalServerError)

      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      ed = data["data"]["results"]["dapil"][0]
      return Pemilu::ElectoralDistrict.new(
          id: ed["id"],
          name: ed["nama"],
          full_name: ed["nama_lengkap"],
          legislative_body: ed["nama_lembaga"],
          available_chairs: ed["jumlah_kursi"],
          population: ed["jumlah_penduduk"],
          province: {
            "id" => ed["provinsi"]["id"],
            "name" => ed["provinsi"]["nama"]
          })
    end

  end
end
