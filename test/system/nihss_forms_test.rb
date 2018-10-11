require "application_system_test_case"

class NihssFormsTest < ApplicationSystemTestCase
  setup do
    @nihss_form = nihss_forms(:one)
  end

  test "visiting the index" do
    visit nihss_forms_url
    assert_selector "h1", text: "Nihss Forms"
  end

  test "creating a Nihss form" do
    visit nihss_forms_url
    click_on "New Nihss Form"

    click_on "Create Nihss form"

    assert_text "Nihss form was successfully created"
    click_on "Back"
  end

  test "updating a Nihss form" do
    visit nihss_forms_url
    click_on "Edit", match: :first

    click_on "Update Nihss form"

    assert_text "Nihss form was successfully updated"
    click_on "Back"
  end

  test "destroying a Nihss form" do
    visit nihss_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nihss form was successfully destroyed"
  end
end
