require 'pg'
require 'json'
require 'open-uri'
  
con = PG.connect :dbname => 'dakvjenroh6bs8', :user => 'wsfxsporhicczg', :password => '0P2B-Jg4GQ5BjP1CuB270ZI0y4', :host =>'ec2-107-21-219-235.compute-1.amazonaws.com'

result = JSON.parse(open("https://cdph.data.ca.gov/api/views/yijp-bauh/rows.json?accessType=DOWNLOAD").read)

puts "Creating Table.........................................................."
create_table="CREATE TABLE MYSQLTABLE(Id INTEGER PRIMARY KEY, year INTEGER,sex TEXT)"
con.exec(create_table)

puts "Inserting values into SQLTABLE.........................................."
$i=1
while $i < 110 do

    $year=result["data"][$i][10]
    $sex=result["data"][$i][11]
    insert_table="INSERT INTO MYSQLTABLE VALUES('#{$i}','#{$year}','#{$sex}')"
    con.exec(insert_table)
    i+=1

end
puts "Values inserted into SQLTABLE successfully..............................."