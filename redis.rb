#connecting to redis database on heroku
$redis = Redis.new(url: ENV["redis://h:p2d92tnpl3a3i695fj0h7us73nl@ec2-54-83-199-200.compute-1.amazonaws.com:14259"])

#fatch fromdata sourse API and store in a variable
result = JSON.parse(open("https://cdph.data.ca.gov/api/views/yijp-bauh/rows.json?accessType=DOWNLOAD").read)

puts result