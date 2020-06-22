class LikesController < ApplicationController
  before_action :require_signin
  before_action :set_event
  
  def create
    @event.likes.create!(user: current_user)
    redirect_to @event, notice: 'Glad you liked it!'
  end

  def destroy
    like = current_user.likes.find_by(params[:id])
    like.destroy

    redirect_to @event
  end
  
  

  private 

  def set_event
    @event = Event.find(params[:event_id])
  end
  
end
