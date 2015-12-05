class WelcomeController < ApplicationController

  # GET /welcome
  def index

  end

def getData
  
  id=params[:id]

  db[:heroku_5x71tdz7].find('unique' => id).each {|data1| 
  
render json:data1
    
    
  }

  
end


end
