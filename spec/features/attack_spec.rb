RSpec.feature 'attacking opponent' do

  scenario 'pressing button to attack player 1' do
    sign_in_and_play
    click_button "Attack!"
    expect(page).to have_content "You attacked the opponent."
  end

  scenario 'attacking P2 reduced their HP' do
    sign_in_and_play
    click_button "Attack!"
    expect(page).to have_content "80/100 HP"
  end

  scenario 'attack acknowledged button switches player' do
    sign_in_and_play
    click_button "Attack!"
    click_button "Return"
    expect(page).to have_content "Welcome to BATTLE."
    expect(page).to have_content "#{$game.player_swap.first.name}, your turn."
  end


end
