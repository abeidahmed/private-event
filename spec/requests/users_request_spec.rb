require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe '#create' do
    it 'should create the user' do
      post users_path, params: { user: attributes_for(:user) }

      expect(User.count).to eq(1)
    end

    it 'should set the cookie' do
      post users_path, params: { user: attributes_for(:user) }

      expect(cookies[:auth_token]).to eq(User.first.id.to_s)
    end
  end
end
