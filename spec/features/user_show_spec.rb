require 'rails_helper'

RSpec.describe 'UserShows', type: :feature do
  it 'should list all the users events' do
    event_attended = create(:event_attendance)
    user = event_attended.attendee
    event = event_attended.attended_event
    feature_sign_in(user)
    visit user_path(user)

    expect(page).to have_link(event.name, href: event_path(event))
  end

  it 'should list all the upcoming events' do
    event = create(:event, :upcoming)
    event_attended = create(:event_attendance, attended_event: event)
    user = event_attended.attendee
    feature_sign_in(user)
    visit user_path(user)

    expect(page).to have_link(event.name, href: event_path(event))
  end

  it 'should list all the previously attended events' do
    event = create(:event, :past)
    event_attended = create(:event_attendance, attended_event: event)
    user = event_attended.attendee
    feature_sign_in(user)
    visit user_path(user)

    expect(page).to have_link(event.name, href: event_path(event))
  end
end
