require 'json'
require 'open-uri'
require 'redis'

#fatch fromdata sourse API and store in a variable
result = JSON.parse(open("https://cdph.data.ca.gov/api/views/yijp-bauh/rows.json?accessType=DOWNLOAD").read)

$i=1
while $i < 110 do

HSET mykey index '#{$i}'
HSET mykey year result["data"][$i][10]
HSET mykey sex result["data"][$i][11] 

end

HGETALL mykey