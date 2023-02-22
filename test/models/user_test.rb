# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without a name' do
    assert_not item.save, 'Saved user without name'
  end

  test 'Should save user with a name' do
    user = User.new(name: 'Test')
    assert user.save, 'Saved user with name'
  end
end
