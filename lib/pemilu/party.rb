module Pemilu
  class Party
    attr_reader :id, :nick_name, :full_name, :url, :facebook, :twitter
    def initialize(id: nil, nick_name: nil, full_name: nil, url: nil, facebook: nil, twitter: nil)
      @id        = id
      @nick_name = nick_name
      @full_name = full_name
      @url       = url
      @facebook  = facebook
      @twitter   = twitter

    end
  end
end
