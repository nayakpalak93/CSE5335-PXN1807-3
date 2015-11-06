require 'pg'
require 'json'
require 'open-uri'

  
con = PG.connect :dbname => 'dakvjenroh6bs8', :user => 'wsfxsporhicczg', :password => '0P2B-Jg4GQ5BjP1CuB270ZI0y4', :host =>'ec2-107-21-219-235.compute-1.amazonaws.com'

result = JSON.parse(open("https://cdph.data.ca.gov/api/views/yijp-bauh/rows.json?accessType=DOWNLOAD").read)

puts "Creating Table.........................................................."
create_table="CREATE TABLE IF NOT EXISTS MYSQLTABLE(Id INTEGER PRIMARY KEY, year INTEGER,sex TEXT)"
con.exec(create_table)
con.exec("DELETE FROM MYSQLTABLE")
puts "Inserting values into SQLTABLE.........................................."
$i=1
while $i < 110 do

    $year=result["data"][$i][10]
    $sex=result["data"][$i][11]
    insert_table="INSERT INTO MYSQLTABLE VALUES('#{$i}','#{$year}','#{$sex}')"
    con.exec(insert_table)
    $i+=1

end
puts "Values inserted into SQLTABLE successfully..............................."

puts "fatching value from table where ID=7 ....................................."

fatchById="SELECT year,sex FROM MYSQLTABLE WHERE Id=7"

rs=con.exec(fatchById)

my_results = {}

rs.each do |row|
  my_results["year"] = row['year']
  my_results["sex"] = row['sex']
end

 
puts my_results

puts "fatching rows of database where year is 2002"

fatchByYear = "SELECT Id,year,sex FROM MYSQLTABLE WHERE year=2002"

rs1=con.exec(fatchByYear)

result={}

rs1.each do |row|
  result["year"] = row['year']
  result["sex"] = row['sex']
end

puts result
