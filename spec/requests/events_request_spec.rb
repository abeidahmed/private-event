require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe '#create' do
    it 'should create the event' do
      user = create(:user)
      sign_in(user)
      post events_path, params: { event: attributes_for(:event) }

      expect(user.events.count).to eq(1)
    end

    it 'should add the current_user to the event attendee list' do
      user = create(:user)
      sign_in(user)
      post events_path, params: { event: attributes_for(:event) }

      expect(EventAttendance.count).to eq(1)
    end
  end
end
