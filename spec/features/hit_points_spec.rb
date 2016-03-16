require 'spec_helper'

feature 'Checking hit points' do
  scenario 'Returns player 2s hit points' do
    sign_in_and_play
    expect(page).to have_content('Murilo has 60/60 HP')
  end
end
