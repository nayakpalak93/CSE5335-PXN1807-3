require 'pg'
  
# Output a table of current connections to the DB
conn = pg.connect( dbname: 'dakvjenroh6bs8',user:'wsfxsporhicczg',password:'0P2B-Jg4GQ5BjP1CuB270ZI0y4' )

#fetching data from data sourse api and storing it intoo data variable
data = JSON.parse(open("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json").read)

int i=0
create_table="CREATE TABLE ARTISTS(Id INTEGER PRIMARY KEY, Name TEXT)"
conn.exec(query)
data["similarartists"]["artist"].each{|artist|
    value=artist["name"]
    insert_table="INSERT INTO TABLE VALUES('#{i}','#{value}')"
    conn.exec(insert_table)
    i+=1
}




