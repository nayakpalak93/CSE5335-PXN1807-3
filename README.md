# PROJECT PHASE 2
***
### NAME : NAYAK PALAK ASHOKBHAI
### Student ID: 1001241807
***

#### 1) What is your external data source used to  populate your Heroku data source?

I have used "Infectious Disease Cases by County, Year, and Sex, 2001-2014" data source from http://www.data.gov/developers/apis web service.  
To open data source i have used [click here](https://cdph.data.ca.gov/api/views/yijp-bauh/rows.json?accessType=DOWNLOAD).

#### 2) What are the heroku toolbelt command to execute the the script?

-Unzip the project file in User directory having ruby on rails.

1.cd cse5335-pxn1807-2  
  
2.bundle install  
  
3.heroku run bash  
  
4.ruby mysql.rb  
=> After run this command, enter Index between 1 to 109 to retrieve data based on primary unique key. Later, enter year between 2001 and 2014 to retrieve data based upon non-primary key.  
  
5.ruby mongodb.rb  
=> After run this command, enter Index between 1 to 109 to retrieve data based on primary unique key. Later, enter year between 2001 and 2014 to retrieve data based upon non-primary key.  
  
6.ruby myredis.rb  
=> After run this command, enter Index between 1 to 109 to retrieve data based on primary unique key. Later, enter year between 2001 and 2014 to retrieve data based upon non-primary key.  

### 3) What aspect of implementation did you find easy,and why?

once connected to database on heroku, I found it easy to store and fetch data from database.  

### 4)What aspect of implementation did you find hard,and why?  

Understanding of methods of storage on each database type is little difficult as each database stores data in different way such as Redis stores data in the form of Key-Value pair and MongoDB stores data in the form of Documents.Thus, retrieval of data from each database needs different queries.




