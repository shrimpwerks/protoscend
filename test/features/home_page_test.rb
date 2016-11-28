require "test_helper"

class HomePageTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Oregon State Indoor Climbing Center"
  end
end
