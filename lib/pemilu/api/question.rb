module Pemilu
  class API
    def questions(*args, offset: nil, limit: 100, law: nil, tags: "")
      return tags(@key) if args[0] == :tags
      uri = URI("http://api.pemiluapi.org/pertanyaan/api/questions")
      params = {
        apiKey: @key,
        offset: offset,
        limit: limit,
        law: law,
        tags: tags.gsub(/,\s+/, ",")
      }
      params.delete_if{ |k,v| v.nil? }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)
      result = []
      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      @total_questions = data["data"]["results"]["total"]
      questions = data["data"]["results"]["questions"]
      questions.each do |q|
        result << Pemilu::Question.new(
          id: q["id"],
          question: q["question"],
          answer: q["answer"],
          reference_law: q["reference_law"],
          excerpt_law: q["excerpt_law"],
          tags: q["tags"])
      end
      return result
    end

    def question(id)
      uri = URI("http://api.pemiluapi.org/pertanyaan/api/questions/#{id}")
      params = { apiKey: @key }
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)
      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      q = data["data"]["results"]["questions"]
      return "Can't get Question with id: #{id}" if q == nil
      return Pemilu::Question.new(
          id: q[0]["id"],
          question: q[0]["question"],
          answer: q[0]["answer"],
          reference_law: q[0]["reference_law"],
          excerpt_law: q[0]["excerpt_law"],
          tags: q[0]["tags"])
    end

    def tags(key)
      uri = URI("http://api.pemiluapi.org/pertanyaan/api/tags")
      params = {apiKey: key}
      uri.query = URI.encode_www_form(params)
      respond = Net::HTTP.get_response(uri)
      return "Invalid request error. Please check your API key" if respond.is_a?(Net::HTTPUnauthorized)
      result = []
      data = JSON.parse(respond.body) if respond.is_a?(Net::HTTPSuccess)
      tags = data["data"]["results"]["tags"]
      tags.each do |t|
        result << Pemilu::Question::Tag.new(
          title: t["tag"],
          question_count: t["question_count"])
      end
      return result
    end

  end
end
