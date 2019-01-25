require 'csv'

  def index_gossip
    	json = CSV.read("../db/gossip.csv")
    	puts json.inspect
    end	
index_gossip