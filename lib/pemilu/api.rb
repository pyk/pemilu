require "pp"
module Pemilu
  class API

    attr_reader :key

    def initialize(key: nil)
      @key = key
    end

    def candidates(name: nil, party: nil, electoral_district: nil, election_year: nil, province: nil, gender: nil, religion: nil, legislative_body: nil, limit: 100, offset: nil)

      uri = URI("http://api.pemiluapi.org/candidate/api/caleg")
      params = {
        apiKey: @key,
        nama: name,
        partai: party,
        dapil: electoral_district,
        tahun: election_year,
        provinsi: province,
        jenis_kelamin: gender,
        agama: religion,
        lembaga: legislative_body,
        limit: limit,
        offset: offset
      }
      params.delete_if{ |k,v| v.nil? }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      result = []
      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      @total_candidate = data["data"]["results"]["total"]
      candidates = data["data"]["results"]["caleg"]
      candidates.each do |caleg|
        result << Pemilu::Candidate.new(
          id: caleg["id"],
          name: caleg["nama"],
          gender: caleg["jenis_kelamin"],
          religion: caleg["agama"],
          birthplace: caleg["tempat_lahir"],
          date_of_birth: caleg["tanggal_lahir"],
          marital_status: caleg["status_perkawinan"],
          name_of_couples: caleg["nama_pasangan"],
          number_of_children: caleg["jumlah_anak"],
          village: caleg["kelurahan_tinggal"],
          sub_district: caleg["kecamatan_tinggal"],
          district: caleg["kab_kota_tinggal"],
          province: {
            "id" => caleg["provinsi"]["id"],
            "name" => caleg["provinsi"]["nama"]
            },
          electoral_district: {
            "id" => caleg["dapil"]["id"],
            "nama" => caleg["dapil"]["nama"]
            },
          election_year: caleg["tahun"],
          legislative_body: caleg["lembaga"],
          party: caleg["partai"],
          ordinal: caleg["urutan"],
          picture: caleg["foto_url"])
      end
      return result
    end

    def candidate(id)
      uri = URI("http://api.pemiluapi.org/candidate/api/caleg/#{id}")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      candidate = data["data"]["results"]["caleg"][0]
      return Pemilu::Candidate.new(
        id: candidate["id"],
        name: candidate["nama"],
        gender: candidate["jenis_kelamin"],
        religion: candidate["agama"],
        birthplace: candidate["tempat_lahir"],
        date_of_birth: candidate["tanggal_lahir"],
        marital_status: candidate["status_perkawinan"],
        name_of_couples: candidate["nama_pasangan"],
        number_of_children: candidate["jumlah_anak"].to_i,
        village: candidate["kelurahan_tinggal"],
        sub_district: candidate["kecamatan_tinggal"],
        district: candidate["kab_kota_tinggal"],
        province: {
          "id" => candidate["provinsi"]["id"],
          "name" => candidate["provinsi"]["nama"]
          },
        electoral_district: {
          "id" => candidate["dapil"]["id"],
          "name" => candidate["dapil"]["nama"]
          },
        election_year: candidate["tahun"],
        legislative_body: candidate["lembaga"],
        party: {
          "id" => candidate["partai"]["id"].to_i,
          "name" => candidate["partai"]["nama"]
          },
        ordinal: candidate["urutan"],
        picture: candidate["foto_url"],
        educations: candidate["riwayat_pendidikan"],
        jobs: candidate["riwayat_pekerjaan"],
        organizations: candidate["riwayat_organisasi"])
    end

    def parties
      uri = URI("http://api.pemiluapi.org/candidate/api/partai")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      result = []

      if respond.is_a?(Net::HTTPSuccess)
        data = JSON.parse(respond.body)
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
    end

    def party(id)
      uri = URI("http://api.pemiluapi.org/candidate/api/partai/#{id}")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)

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

    def provinces
      uri = URI("http://api.pemiluapi.org/candidate/api/provinsi")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
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

      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      province = data["data"]["results"]["provinsi"][0]
      return Pemilu::Province.new(
          id: province["id"].to_i,
          name: province["nama"],
          full_name: province["nama_lengkap"],
          international_name: province["nama_inggris"],
          available_chairs: province["jumlah_kursi"],
          population: province["jumlah_penduduk"])
      end

  end
end
