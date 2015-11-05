#!/usr/bin/ruby

# Copyright (c) 2015 ObjectLabs Corporation
# Distributed under the MIT license - http://opensource.org/licenses/MIT

# Written with mongo 1.9.2
# Documentation: http://api.mongodb.org/ruby/
# A ruby script connecting to a MongoDB database given a MongoDB Connection URI.

require "mongo"
require 'open-uri'
require 'json'
include Mongo
# -------------------------------------------------my code starts here

### Standard URI format: mongodb://[dbuser:dbpassword@]host:port/dbname
uri = "mongodb://mydata:7070@ds045664.mongolab.com:45664/heroku_5x71tdz7"

#client = Mongo::MongoClient.from_uri(uri)

db=Mongo::Client.new(['ds045664.mongolab.com:45664'], :database => 'heroku_5x71tdz7', :user => 'testuser', :password => '7070')


#result = JSON.parse(open("http://api.census.gov/data/2013/acs3/variables.json").read)



#puts result



$n=1

while $n<4
$i=1

jsonobj=File.read('views.json')
obj=JSON.parse(jsonobj)
obj.each do |x|
result = db[:heroku_5x71tdz7].insert_one({
  id: $i,
  name: obj[$i]["name"],
  createdAt: obj[$i]["createdAt"]
})
result.n 
$i+=1
end
$n=n+1
end





