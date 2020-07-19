require "test_helper"
require "application_system_test_case"

class CompaniesControllerTest < ApplicationSystemTestCase

  def setup
    @company = companies(:hometown_painting)
  end

  test "Index" do
    visit companies_path

    assert_text "Companies"
    assert_text "Hometown Painting"
    assert_text "Wolf Painting"
  end

  test "Show" do
    visit company_path(@company)

    assert_text @company.name
    assert_text @company.phone
    assert_text @company.email
    assert_text "City, State"
  end

  test "Update" do
    visit edit_company_path(@company)

    within("form#edit_company_#{@company.id}") do
      fill_in("company_name", with: "Updated Test Company")
      fill_in("company_zip_code", with: "93009")
      click_button "Update Company"
    end

    assert_text "Changes Saved"

    @company.reload
    assert_equal "Updated Test Company", @company.name
    assert_equal "93009", @company.zip_code
  end

  test "Create" do
    visit new_company_path

    within("form#new_company") do
      fill_in("company_name", with: "Test Company")
      fill_in("company_zip_code", with: "99501")
      fill_in("company_phone", with: "555555555")
      fill_in("company_email", with: "test_company@getmainstreet.com")
      click_button "Create Company"
    end

  test "Delete" do
    visit company_path(@company)
    assert_difference('Company.count', -1) do
      click_link "Delete"
    end
  end
    assert_text "Saved"

    last_company = Company.last
    assert_equal "Test Company", last_company.name
    assert_equal "99501", last_company.zip_code
  end

test "Valid Email for Company" do
  visit new_company_path

  within("form#new_company") do
    fill_in("company_name", with: "Test Company")
    fill_in("company_zip_code", with: "99501")
    fill_in("company_phone", with: "555555555")
    fill_in("company_email", with: "test_company@getmainstreet.com")
    assert_no_difference('Company.count') do
      click_button 'Create Company'
    end
  end
end

test "Update: city and state after zipcode update" do

    within("form#edit_company_#{@company.id}") do
      fill_in("company_zip_code", with: "99501")
      click_button "Update Company"
    end

    assert_text "Changes Saved"

    @company.reload
    assert_equal "99501", @company.zip_code
    assert_equal "Alaska", @company.city
    assert_equal "AK", @company.state
  end

end
