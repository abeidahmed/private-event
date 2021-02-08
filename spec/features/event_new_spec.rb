require 'rails_helper'

RSpec.describe 'EventNews', type: :feature do
  let(:user) { create(:user) }

  before do
    feature_sign_in(user)
    visit new_event_path
    fill_in 'Name', with: 'Birthday'
    fill_in 'Event date', with: Time.zone.now
    fill_in 'Description', with: 'Hello'
    click_button 'Create'
  end

  it 'should redirect to event page after creating' do
    expect(page).to have_current_path(event_path(Event.first.id))
  end

  it 'should flash success notification' do
    expect(page).to have_text('added to the events')
  end
end
