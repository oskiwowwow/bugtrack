class CallCommentsController < ApplicationController
  def create
    @call = Call.find(params[:call_id])
    params[:call_comment][:author_id] = current_user.person_id
    @call_comment = @call.call_comments.create(params[:call_comment])
    redirect_to call_path(@call)
  end
end
