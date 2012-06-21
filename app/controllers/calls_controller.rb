class CallsController < ApplicationController
  before_filter :logged_in?
  
  def index
    if Person.is_internal?(current_user)
      @calls = Call.order("created_at DESC").all
    else
      @calls = Call.where(client_id: current_user_client.id).order("created_at DESC").all
    end
    respond_to do |format|
      format.html
      format.json { render :json => @calls }
    end
  end

  def show
    @call = Call.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @call }
    end
  end

  def new
    @call = Call.new
    respond_to do |format|
      format.html
      format.json { render :json => @call }
    end
  end

  def edit
    @call = Call.find(params[:id])
  end
  
  def create
    params[:call][:date_entered] = Time.now()
    params[:call][:status_id] = Enum.statuses.where("name = 'New'").first.id
    params[:call][:release_resolved_id] = Enum.releases.where("name = 'TBD'").first.id
    params[:call][:author_id] = current_user.person_id
    unless Person.is_internal?(current_user)
      params[:call][:client_id] = current_user_client.id
      params[:call][:assignee_id] = Client.find(current_user_client).people.order("assignments.order").first.id
    end
    @call = Call.new(params[:call])
    respond_to do |format|
      if @call.save
        format.html { redirect_to calls_url }
        format.json { render :json => @call, :status => :created, :location => @call }
      else
        format.html { render :action => "new" }
        format.json { render :json => @call.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @call = Call.find(params[:id])
    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to calls_url }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @call.errors, :status => :unprocessable_entity }
      end
    end
  end
end
