RSpec.feature 'attacking opponent' do

  scenario 'pressing button to attack player 1' do
    sign_in_and_play
    perform_attack
    expect(page).to have_content "player_one attacked player_two!"
  end

  scenario 'attacking P2 reduced their HP' do
    sign_in_and_play
    perform_attack
    expect(page).not_to have_content "player_two: 100/100 HP"
  end

  scenario 'attack acknowledged button switches player' do
    sign_in_and_play
    perform_attack
    click_button "Return"
    expect(page).to have_content "Welcome to BATTLE."
    expect(page).to have_content "player_two, your turn."
  end

  scenario 'a player can die' do
    sign_in_and_play
    visit '/victory'
    expect(page).to have_content "player_one is dead :("
  end

end
