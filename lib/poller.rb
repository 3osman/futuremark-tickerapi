class Poller
  include HTTParty
  base_uri '3dmark.com'
  def initialize(nextID, maxN)
    @options = { query: {"eventIdStart" => nextID, "eventCountMax" => maxN}, headers: { "Accept" => 'application/json' } }
  end

  def entries
  	response = self.class.get("/proxycon/resultevent/", @options)

  	if response.success?
    	return response
	else
       return nil
    end
  end
  
end