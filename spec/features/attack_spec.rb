require 'spec_helper'

feature 'attacking player 2' do
  scenario 'returns a confirmation of attack' do
    sign_in_and_play
    click_button "Attack!"
    expect(page).to have_content "You have attacked Murilo!"
  end
end
