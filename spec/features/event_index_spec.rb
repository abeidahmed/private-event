require 'rails_helper'

RSpec.describe 'EventIndices', type: :feature do
  it 'lists all the upcoming events' do
    event = create(:event, :upcoming)
    event_attended = create(:event_attendance, attended_event: event)
    user = event_attended.attendee
    feature_sign_in(user)
    visit events_path

    expect(page).to have_link(event.name, href: event_path(event))
  end

  it 'lists all the past events' do
    event = create(:event, :past)
    event_attended = create(:event_attendance, attended_event: event)
    user = event_attended.attendee
    feature_sign_in(user)
    visit events_path

    expect(page).to have_link(event.name, href: event_path(event))
  end
end
