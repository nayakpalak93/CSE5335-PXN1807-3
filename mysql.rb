require 'pg'
require 'JSON'
  
  
db=Mongo::Client.new(['ds045664.mongolab.com:45664'], :database => 'heroku_5x71tdz7', :user => 'testuser', :password => '7070')

result = JSON.parse(open("https://cdph.data.ca.gov/api/views/yijp-bauh/rows.json?accessType=DOWNLOAD").read)

puts "Creating Table.........................................................."
create_table="CREATE TABLE SQLTABLE(Id INTEGER PRIMARY KEY, year INTEGER,sex TEXT)"
db.exec(query)

puts "Inserting values into SQLTABLE.........................................."
$i=1
while $i < 110 do

    year=result["data"][$i][10]
    sex=result["data"][$i][11]
    insert_table="INSERT INTO TABLE VALUES('#{i}','#{year}','#{sex}')"
    db.exec(insert_table)
    i+=1

end
puts "Values inserted into SQLTABLE successfully..............................."