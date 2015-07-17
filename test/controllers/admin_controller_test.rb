require 'test_helper'

class AdminsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    sign_in users(:lucy)
  end

  def test_show
    get :show
    assert_response :success
  end

  def test_update_good
    post :update, user: { email: 'joe@bloggs.com' }
    assert_redirected_to admin_path
    assert_not_nil User.find_by(email: 'joe@bloggs.com')
  end

  def test_update_bad
    post :update, user: { email: users(:lucy).email }
    assert_response :success
    assert_template 'show'
    assert_select 'div#error_explanation'
  end

  def test_signed_out
    sign_out(users(:lucy))
    get :show
    assert_redirected_to new_user_session_url
  end

end
