module Pemilu
  class API
    def parties
      uri = URI("http://api.pemiluapi.org/candidate/api/partai")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      result = []
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)

      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      @total_parties = data["data"]["results"]["count"]
      parties = data["data"]["results"]["partai"]
      parties.each do |party|
        result << Pemilu::Party.new(
          id: party["id"].to_i,
          nick_name: party["nama"],
          full_name: party["nama_lengkap"],
          url: party["url_situs"],
          facebook: party["url_facebook"],
          twitter: party["url_twitter"]
        )
      end
      return result
    end

    def party(id)
      uri = URI("http://api.pemiluapi.org/candidate/api/partai/#{id}")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)
      return "Can't get Party with id: #{id}" if respond.is_a?(Net::HTTPBadRequest)
      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      party = data["data"]["results"]["partai"][0]
      return Pemilu::Party.new(
          id: party["id"].to_i,
          nick_name: party["nama"],
          full_name: party["nama_lengkap"],
          url: party["url_situs"],
          facebook: party["url_facebook"],
          twitter: party["url_twitter"]
        )
    end

  end
end
