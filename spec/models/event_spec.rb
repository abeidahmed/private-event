require 'rails_helper'

RSpec.describe Event, type: :model do
  subject(:event) { build(:event) }

  describe 'association' do
    it { is_expected.to belong_to(:creator).class_name('User') }

    it { is_expected.to have_many(:event_attendances).with_foreign_key(:attended_event_id) }

    it { is_expected.to have_many(:attendees).source(:attendee) }
  end

  describe '::past' do
    it 'should list all the past events' do
      past_event = create(:event, :past)
      create(:event, :upcoming)

      expect(Event.past.map(&:id)).to match_array([past_event.id])
    end
  end

  describe '::upcoming' do
    it 'should list all the upcoming events' do
      create(:event, :past)
      upcoming_event = create(:event, :upcoming)

      expect(Event.upcoming.map(&:id)).to match_array([upcoming_event.id])
    end
  end
end
