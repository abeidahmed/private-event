require 'rails_helper'

RSpec.describe 'EventAttendances', type: :request do
  describe '#create' do
    it 'should add the user to the attendee list' do
      user = create(:user)
      event = create(:event)
      sign_in(user)
      post event_event_attendances_path(event), params: nil

      expect(EventAttendance.count).to eq(1)
    end
  end

  describe '#destroy' do
    it 'should destroy the attendee from the event list' do
      user = create(:user)
      sign_in(user)
      event_attendance = create(:event_attendance)
      delete event_attendance_path(event_attendance)

      expect { EventAttendance.find(event_attendance.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
