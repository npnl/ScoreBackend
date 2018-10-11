require 'test_helper'

class NihssFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nihss_form = nihss_forms(:one)
  end

  test "should get index" do
    get nihss_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_nihss_form_url
    assert_response :success
  end

  test "should create nihss_form" do
    assert_difference('NihssForm.count') do
      post nihss_forms_url, params: { nihss_form: {  } }
    end

    assert_redirected_to nihss_form_url(NihssForm.last)
  end

  test "should show nihss_form" do
    get nihss_form_url(@nihss_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_nihss_form_url(@nihss_form)
    assert_response :success
  end

  test "should update nihss_form" do
    patch nihss_form_url(@nihss_form), params: { nihss_form: {  } }
    assert_redirected_to nihss_form_url(@nihss_form)
  end

  test "should destroy nihss_form" do
    assert_difference('NihssForm.count', -1) do
      delete nihss_form_url(@nihss_form)
    end

    assert_redirected_to nihss_forms_url
  end
end
