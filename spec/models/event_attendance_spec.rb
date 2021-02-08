require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  subject(:event_attendance) { build(:event_attendance) }

  describe 'association' do
    it { is_expected.to belong_to(:attendee).class_name('User') }

    it { is_expected.to belong_to(:attended_event).class_name('Event') }
  end
end
