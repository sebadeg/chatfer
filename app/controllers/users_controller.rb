class UsersController < ApplicationController

  before_action :authenticate_user!

  def result(outputHTML,outputJSON)
    respond_to do |format|
      format.html { 
        if outputHTML != nil
          redirect_to outputHTML
        end      
      }
      format.json { 
        if outputJSON != nil
          render :json => outputJSON, :status => :ok
        else
          render :json => "", :status => :bad_request
        end
      }
    end
  end

  def index
    p "Index"
    if ( current_user.id == 1 )
      @elements = User.all
    else
      @elements = Array.new
    end
    result(nil,@elements)
  end  

end
