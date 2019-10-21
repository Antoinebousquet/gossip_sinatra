class Gossip
	attr_accessor :author, :content, :fin_url

	def initialize(author, content)
		@author = author
		@content = content
	end

	def save
		CSV.open("./db/gossip.csv", "ab") do |table|
			table << [@author,@content]
		end
	end

	def self.all
	  all_gossips = [] #on initialise un array vide

	  CSV.read("./db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end
	  return all_gossips
	end

	def self.find(fin_url)
		end_url = "http://localhost:4567/gossips/" + fin_url
		@fin_url = fin_url
  	return end_url
	end

end