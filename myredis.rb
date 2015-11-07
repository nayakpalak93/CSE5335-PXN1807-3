require 'json'
require 'open-uri'
require 'redis'

redis = Redis.new(:host => "ec2-54-83-199-200.compute-1.amazonaws.com", :port => 14259, :url => "redis://h:p2d92tnpl3a3i695fj0h7us73nl@ec2-54-83-199-200.compute-1.amazonaws.com:14259", :password => "p2d92tnpl3a3i695fj0h7us73nl")

#fatch fromdata sourse API and store in a variable
result = JSON.parse(open("https://cdph.data.ca.gov/api/views/yijp-bauh/rows.json?accessType=DOWNLOAD").read)

#storing values intoredis database on heroku
$i=1
while $i < 110 do
    $year=result["data"][$i][10]
    $sex=result["data"][$i][11]
redis.hset "row#{$i}","index",$i
redis.hset "row#{$i}","year", $year
redis.hset "row#{$i}","sex", $sex
puts redis.hgetall "row#{$i}"
$i+=1
end

puts "values stored to Redis database successfully"

#fatching value from database

puts "Enter index you want to retrieve.."
$index=gets.chomp

puts redis.hgetall "row#{$index}"