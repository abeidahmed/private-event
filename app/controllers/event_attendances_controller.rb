class EventAttendancesController < ApplicationController
  before_action :authenticate_user

  def create
    @event = Event.find(params[:event_id])
    @event_attendance = current_user.event_attendances.build(attended_event: @event)

    if @event.attendees.exists?(current_user.id)
      redirect_back fallback_location: root_path, error: 'You have already joined this event'
    else
      @event_attendance.save
      redirect_back fallback_location: root_path, success: 'You have joined this event'
    end
  end

  def destroy
    @event_attended = EventAttendance.find(params[:id])
    @event_attended.destroy

    redirect_back fallback_location: root_path, success: 'Removed from this event'
  end
end
