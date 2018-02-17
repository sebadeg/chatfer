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
    if ( current_user.id <= 2 )
      @elements = Chat.all
    else
      @elements = Array.new
    end

    result(nil,@elements)
  end  

  def create
    p "Create"


    @element = Chat.new( 
      user_id: current_user.id, 
      texto: params[:chat][:texto],
      hide: false
       )
    if ( @element != nil ) && ( !@element.save )
      @element = nil
    end
    
    if current_user.id != 1 
      @elements = Chat.all
      @elements.each do |e|
        if !e.hide
          e.hide = true
          e.save
        end
      end
    end

    result(chats_path,@element)
  end

end
