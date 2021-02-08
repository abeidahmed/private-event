require 'rails_helper'

RSpec.describe 'SignIns', type: :feature do
  it 'should redirect to root page after signing in' do
    user = create(:user)
    visit new_session_path
    fill_in 'Name', with: user.name
    click_button 'Sign in'

    expect(page).to have_current_path(root_path)
  end

  it 'should flash error if sign in fails' do
    visit new_session_path
    fill_in 'Name', with: 'John'
    click_button 'Sign in'

    expect(page).to have_text('Invalid')
  end
end
