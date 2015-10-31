#class WelcomeController < ApplicationController
# Referance : http://stackoverflow.com/questions/16765864/extract-json-values-from-remote-api-with-ruby
#http://zetcode.com/db/sqliteruby/connect/
require 'json'
require 'open-uri'
require 'sqlite3'
i = 0
num = 100
var = 1

quotes="'"
begin
db = SQLite3::Database.open "test.db"
    db.execute "CREATE TABLE IF NOT EXISTS Movie(Id INTEGER PRIMARY KEY, Name TEXT)"
    db.execute "DELETE FROM Movie"

while i < num  do

    data = JSON.parse(open("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json").read)

    
      
      # iterate through the Array of returned artists and print their names                                                                                 
      data["similarartists"]["artist"].each do |artist|
      # puts "1"	
      testvar = quotes+artist["name"].tr('^A-Za-z0-9',' ')+quotes
      
      db.execute "INSERT INTO Movie VALUES(#{var},#{testvar})"
      #  puts artist["name"];
      puts "#{var}  #{testvar}"
      var = var + 1;
    end

    i = i + 1;
end
puts "***************************************************************************"
puts "total data = #{var}"
puts "***************************************************************************"
#end
puts "data obtained by query from primary key value \s"
stm = db.prepare "SELECT * FROM Movie WHERE Movie.Id = 99" 
rs = stm.execute 
    
rs.each do |row|
    puts row.join "\s"
end
puts "***************************************************************************\s"
#end
puts "data obtained by query from non primary key value"
stm = db.prepare "SELECT * FROM Movie WHERE Movie.Name = 'Interpol'" 
rs = stm.execute 
    
rs.each do |row|
    puts row.join "\s"
end
    
    
rescue SQLite3::Exception => e
    
    puts "Exception occurred"
    puts e

    

end