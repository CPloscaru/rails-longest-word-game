require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector("div", class: "btn-primary", count: 10)
  end

  # test "Fill the form in /new with random ord, click to play and verify that the word is not in the grid" do
  #   visit new_url
  #   fill_in "answer", with: "JeNeSuisPasDansLaGrille"
  #   click_on "Play"
  # end
end
