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


db=Mongo::Client.new(['ds045664.mongolab.com:45664'], :database => 'heroku_5x71tdz7', :user => 'testuser', :password => '7070')


result = JSON.parse(open("https://cdph.data.ca.gov/api/views/yijp-bauh/rows.json?accessType=DOWNLOAD").read)
$i=1
while $i < 110 do
n = db[:heroku_5x71tdz7].insert_one({
unique: $i,
year: result["data"][$i][10],
sex: result["data"][$i][11]
})
$i+=1
end

puts "Data Stored in MongoDB database successfully.............."


puts "Enter a year to get data of that year.."
$year=gets.chomp
db[:heroku_5x71tdz7].find('year' => $year).each {|data|
puts data }


puts "Enter the unique primary key to retrieve the data.."
$id=gets.chomp

db[:heroku_5x71tdz7].find('unique' => $id).each {|data| 
puts data}

=begin

$i=1
$n=1
jsonobj=File.read('views.json')
obj=JSON.parse(jsonobj)

while $n<4
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

=end



