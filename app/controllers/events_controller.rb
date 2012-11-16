class EventsController < ApplicationController
    # GET /users/:user_id/events
   # GET /users/:user_id/events.xml
    def index
      #1st you retrieve the user thanks to params[:user_id]
      user = User.find(params[:user_id])
      #2nd you get all the events of this user
      @events = user.events
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @events }
      end
    end
    # GET /users/:user_id/events/:id
    # GET /events/:id.xml
    def show
      #1st you retrieve the user thanks to params[:user_id]
      user = User.find(params[:user_id])
      #2nd you retrieve the event thanks to params[:id]
      @event = user.events.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @event }
      end
    end
    # GET /users/:user_id/events/new
    # GET /users/:user_id/events/new.xml
    def new
      #1st you retrieve the user thanks to params[:user_id]
      user = User.find(params[:user_id])
      #2nd you build a new one
      @event = user.events.build
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @event }
      end
    end
    # GET /users/:user_id/events/:id/edit
    def edit
      #1st you retrieve the user thanks to params[:user_id]
      user = User.find(params[:user_id])
      #2nd you retrieve the event thanks to params[:id]
      @event = user.events.find(params[:id])
    end
    # POST /users/:user_id/events
    # POST /users/:user_id/events.xml
    def create
      #1st you retrieve the user thanks to params[:user_id]
      user = User.find(params[:user_id])
      #2nd you create the event with arguments in params[:event]
      @event = user.events.create(params[:event])
      respond_to do |format|
        if @event.save
          #1st argument of redirect_to is an array, in order to build the correct route to the nested resource event
          format.html { redirect_to([@event.user, @event], :notice => 'Comment was successfully created.') }
          #the key :location is associated to an array in order to build the correct route to the nested resource event
          format.xml  { render :xml => @event, :status => :created, :location => [@event.user, @event] }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
        end
      end
    end
    # PUT /users/:user_id/events/:id
    # PUT /users/:user_id/events/:id.xml
    def update
      #1st you retrieve the user thanks to params[:user_id]
      user = User.find(params[:user_id])
      #2nd you retrieve the event thanks to params[:id]
      @event = user.events.find(params[:id])
      respond_to do |format|
        if @event.update_attributes(params[:event])
          #1st argument of redirect_to is an array, in order to build the correct route to the nested resource event
          format.html { redirect_to([@event.user, @event], :notice => 'Comment was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
        end
      end
    end
    # DELETE /users/:user_id/events/1
    # DELETE /users/:user_id/events/1.xml
    def destroy
      #1st you retrieve the user thanks to params[:user_id]
      user = User.find(params[:user_id])
      #2nd you retrieve the event thanks to params[:id]
      @event = user.events.find(params[:id])
      @event.destroy
      respond_to do |format|
        #1st argument reference the path /users/:user_id/events/
        format.html { redirect_to(user_events_url) }
        format.xml  { head :ok }
      end
    end
end
