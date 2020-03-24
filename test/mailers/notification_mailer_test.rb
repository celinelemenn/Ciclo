 # frozen_string_literal: true

require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase

  def setup
    @user = users(:one)
  end

  test 'welcome' do
    email = NotificationMailer.welcome(@user)
    assert_emails 1 do
      email.deliver_later
    end

    assert_equal email.to, [@user.email]
    assert_equal email.from, ['info@gathuku.tech']
    assert_equal email.subject, 'Welcome to my App'
    assert_match 'Thanks for signing', email.body.encoded
  end
end
