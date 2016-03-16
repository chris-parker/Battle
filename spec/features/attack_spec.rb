require 'spec_helper'

feature 'attacking player 2' do
  scenario 'returns a confirmation of attack' do
    sign_in_and_play
    click_button "Attack!"
    expect(page).to have_content "You have attacked Murilo!"
  end

  scenario 'switches turn' do
    sign_in_and_play
    click_button "Attack!"
    click_button 'OK'
    expect(page).to have_content "Murilo's turn"
  end
end
