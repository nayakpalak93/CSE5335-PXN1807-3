class WelcomeController < ApplicationController

  # GET /welcome
  def index

  end

def getData
  db=Mongo::Client.new(['ds045664.mongolab.com:45664'], :database => 'heroku_5x71tdz7', :user => 'testuser', :password => '7070')
  id=params[:id]

  db[:heroku_5x71tdz7].find('unique' => id).each {|data1| 
  
render json:data1
    
    
  }

  
end


end
