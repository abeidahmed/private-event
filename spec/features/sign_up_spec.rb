require 'rails_helper'

RSpec.describe 'SignUps', type: :feature do
  it 'should redirect to root page after signup' do
    visit new_user_path
    fill_in 'Name', with: 'John Doe'
    click_button 'Sign up'

    expect(page).to have_current_path(root_path)
  end

  it 'should show notification after sign up' do
    visit new_user_path
    fill_in 'Name', with: 'John Doe'
    click_button 'Sign up'

    expect(page).to have_text('Successfully')
  end

  it 'should render new action after error' do
    visit new_user_path
    fill_in 'Name', with: ''
    click_button 'Sign up'

    expect(page).to have_text('be blank')
  end
end
