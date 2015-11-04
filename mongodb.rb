#!/usr/bin/ruby

# Copyright (c) 2015 ObjectLabs Corporation
# Distributed under the MIT license - http://opensource.org/licenses/MIT

# Written with mongo 1.9.2
# Documentation: http://api.mongodb.org/ruby/
# A ruby script connecting to a MongoDB database given a MongoDB Connection URI.

require "mongo"
require "json"
include Mongo
# -------------------------------------------------my code starts here

### Standard URI format: mongodb://[dbuser:dbpassword@]host:port/dbname
uri = "mongodb://mydata:7070@ds045664.mongolab.com:45664/heroku_5x71tdz7"

#client = Mongo::MongoClient.from_uri(uri)

db=Mongo::Client.new(['ds045664.mongolab.com:45664'], :database => 'heroku_5x71tdz7', :user => 'testuser', :password => '7070')


jsonobj=File.read('views.json')
obj=JSON.parse(jsonobj)

puts obj



#db = client.db(heroku_5x71tdz7)

#fetching data from data sourse api and storing it intoo data variable
#data = JSON.parse(open("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json").read)

#add data intodatabase
=begin
  raise 'A test exception.'
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
else
  # other exception
ensure
  # always executed
end
i = 1
data["similarartists"]["artist"].each { |x|
  db.collection("atristsList").insert_one({ID: i.to_s, Title: x["name"]})
  var += 1;
}


#fatchind data from database 
# 1)by primary key:

puts db.users.find( { 'id' => { '$eq'=> 9 } }, { 'ID'=> '1', 'Title'=> '1' } ).limit(100)

songs.find({ 'weeksAtOne' => { '$gte' => 10 } }).sort('decade', 1)
# 2)by non primary key

puts db.users.find( { 'Title'=> { '$eq'=> 'The National' } }, { 'ID'=> '1', 'Title'=> '1' } )

#---------------------------------------------------my code ends here

=end

