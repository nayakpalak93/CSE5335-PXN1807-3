require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

include Mongo

i = 0
num = 100
var = 0

quotes="'"

db = Mongo::Client.new(['127.0.0.1:27017'],:database => 'Movies')

while i < num  do

    data = JSON.parse(open("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json").read)
      
      # iterate through the Array of returned artists and print their names                                                                                 
        data["similarartists"]["artist"].each do |artist|
	      #puts "#{testvar}"
    	  insertintable = db[:Movies].insert_one({ID: var.to_s, Title: artist["name"]})
      	   #  puts artist["name"];
    	  var = var + 1;
    	end

    i = i + 1;

end
puts '***************************************************************'
puts "total data obtained = #{var}"
puts '***************************************************************'
puts 'Data obtained by retrieving query using primary key'
db[:Movies].find(:ID => '99').each {|document| puts document }

puts '***************************************************************'
puts 'Data obtained by retrieving query using non-primary key'

db[:Movies].find(:Title => 'Interpol').each {|document| puts document 