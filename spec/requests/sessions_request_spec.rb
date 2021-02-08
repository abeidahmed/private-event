require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe '#create' do
    it 'should login user' do
      user = create(:user)
      post sessions_path, params: { name: user.name }

      expect(cookies[:auth_token]).to eq(user.id.to_s)
    end
  end

  describe '#destroy' do
    it 'should logout the user' do
      user = create(:user)
      sign_in(user)
      delete session_path(user)

      expect(cookies[:auth_token]).to be_blank
    end
  end
end
