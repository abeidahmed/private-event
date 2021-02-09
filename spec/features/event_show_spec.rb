require 'rails_helper'

RSpec.describe 'EventShows', type: :feature do
  let(:event_attended) { create(:event_attendance) }
  let(:user) { event_attended.attendee }
  let(:event) { event_attended.attended_event }

  before do
    feature_sign_in(user)
    visit event_path(event)
  end

  it 'should show the event details' do
    expect(page).to have_text(event.name)
  end

  it 'should list the attendees of the event' do
    within '#attendee-list' do
      expect(page).to have_text(user.name)
    end
  end

  it 'should have the exit button' do
    expect(page).to have_button('Exit this event')
  end
end
