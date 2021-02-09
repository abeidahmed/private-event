class EventsController < ApplicationController
  before_action :authenticate_user, only: %i[new create]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      EventAttendance.create! attendee: current_user, attended_event: @event
      redirect_to @event, success: 'You have been added to the events attendee list'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :description)
  end
end
