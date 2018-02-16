class ChatsController < ApplicationController

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
    @element = Chat.new()
    @elements = Chat.all
    result(nil,@elements)
  end  

  def create
    p "Create"
    @element = Chat.new( 
      user_id: 1, 
      texto: params[:chat][:texto] )
    if ( @element != nil ) && ( !@element.save )
      @element = nil
    end
    result(chats_path,@element)
  end

end
