require 'dbi'
require 'pg'

#retrieve data from data source.
data = JSON.parse(open("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json").read)

begin
     # connect to the MySQL server
     dbh = DBI.connect("postgres://wsfxsporhicczg:0P2B-Jg4GQ5BjP1CuB270ZI0y4@ec2-107-21-219-235.compute-1.amazonaws.com:5432/dakvjenroh6bs8", 
	                    "wsfxsporhicczg", "0P2B-Jg4GQ5BjP1CuB270ZI0y4")
	 
	 i=1
	 data["similarartists"]["artist"].each { |x|
	 q=""
	 value=q+x["name"]+q
	     dbh.do("INSERT INTO TABLE ARTIST VALUES(#{i},#{value})")
	     i+=1
	 }
	 puts "record added succesfully tomysql database........"
	 dbh.commit
	 
rescue DBI::DatabaseError => e
     puts "An error occurred"
     puts "Error code:    #{e.err}"
     puts "Error message: #{e.errstr}"
     dbh.rollback
ensure
     # disconnect from server
     dbh.disconnect if dbh
end
	 
	 