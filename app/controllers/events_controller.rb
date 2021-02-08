class EventsController < ApplicationController
  before_action :authenticate_user, only: %i[new create]

  def index; end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show; end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :description)
  end
end
