
require 'pry'
require 'rubygems'
require 'csv'
require 'json'
require 'pp'


  class Gossip
	attr_reader :content, :author
 
  @@user_count = 0
 
    def initialize(author, content)
      @content = content
      @author = author
      @@user_count = @@user_count + 1
    end
    
    def save
     #a = {}	
  	 h = {@author => @content}
  	 #a = {@@user_count => h}
  	  #File.open("../db/gossip.json","a") do |f|
		#f.write a.to_json
  	  #end
  	CSV.open("db/gossip.csv", "a") {|csv| h.to_a.each {|elem| csv << elem} }
    end	
    
    def self.all
      i = 0
      csv = CSV.read("db/gossip.csv")
      csv.each do |ligne|
      all_gossips = [ligne] #gossip_provisoire
	  print ligne	
	  i+=1
	    if i == 1
	      puts " "
	      i = 0
	    end
	  end
    end

    def destroy
      x = @author
      csv = CSV.read("db/gossip.csv")
       csv[x.to_i] = nil 
       
       #system("rm ../db/gossip.csv")
       a = []
       r = 0
       for i in 0...csv.length
       	if csv[i]!= nil
       	 a[r] = csv[i]
       	 r+=1
     	end
       end
       puts "#{a}"
       fichier= File.open("db/gossip.csv", "w")
       for i,c in a 
       		fichier.puts("#{i},#{c}")
       end
       fichier.close
	 #CSV.open("../db/gossip.csv", "wb") {|csv| csv.to_a.each {|elem| csv << elem} }
    end	


end




