require 'test_helper'

class OrganicUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organic_unit = organic_units(:one)
  end

  test "should get index" do
    get organic_units_url
    assert_response :success
  end

  test "should get new" do
    get new_organic_unit_url
    assert_response :success
  end

  test "should create organic_unit" do
    assert_difference('OrganicUnit.count') do
      post organic_units_url, params: { organic_unit: { acronym: @organic_unit.acronym, name: @organic_unit.name } }
    end

    assert_redirected_to organic_unit_url(OrganicUnit.last)
  end

  test "should show organic_unit" do
    get organic_unit_url(@organic_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_organic_unit_url(@organic_unit)
    assert_response :success
  end

  test "should update organic_unit" do
    patch organic_unit_url(@organic_unit), params: { organic_unit: { acronym: @organic_unit.acronym, name: @organic_unit.name } }
    assert_redirected_to organic_unit_url(@organic_unit)
  end

  test "should destroy organic_unit" do
    assert_difference('OrganicUnit.count', -1) do
      delete organic_unit_url(@organic_unit)
    end

    assert_redirected_to organic_units_url
  end
end
