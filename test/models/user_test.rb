# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = users(:user1)
  end

  test 'see if auth and user have the same account' do
    user = User.new(provider: 'github', uid: '01')
    omniauth = User.from_omniauth(user)
    assert_equal @user1, omniauth
  end

  test 'save a new account if auth and user do not have the same account' do
    user = OmniAuth::AuthHash.new(
      provider: 'github',
      uid: '02',
      info: {
        email: 'user02@exmaple.com'
      },
      password: Devise.friendly_token[0, 20]
    )
    omniauth = User.from_omniauth(user)
    assert_equal omniauth, User.where(provider: 'github', uid: '02').first
  end
end
