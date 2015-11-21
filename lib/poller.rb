class Poller
  include HTTParty
  base_uri '3dmark.com'
  def initialize(nextID, maxN)
  	puts "initialize"

    @options = { query: {"eventIdStart" => nextID, "eventCountMax" => maxN}, headers: { "Accept" => 'application/json' } }
  end

  def entries
    self.class.get("/proxycon/resultevent/", @options)
  end
  #def get_details(id)
   # HTTParty.get(base_uri, :query => {:DID => id, :DeveloperKey => devKey})
   # @json_hash = api_response.parsed_response
   # return @json_hash
  #end
end