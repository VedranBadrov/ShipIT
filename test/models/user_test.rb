# frozen_string_literal: true

require 'test_helper'



class UserTest < ActiveSupport::TestCase
    test "should not save user without email" do
        user = User.new
        assert_not user.save, "Saved the user without an email"
      end
    
      test "should save user with valid email and password" do
        user = User.new(email: "test@example.com", password: "password")
        assert user.save, "Could not save the user with a valid email and password"
      end
    
      test "should set default role to user" do
        user = User.new(email: "test@example.com", password: "password")
        assert user.save, "Could not save the user with a valid email and password"
        assert_equal user.role, "user", "Default role not set to user"
      end
    
      test "should set role to admin" do
        user = User.new(email: "test@example.com", password: "password", role: "admin")
        assert user.save, "Could not save the user with a valid email, password, and role"
        assert_equal user.role, "admin", "Role not set to admin"
      end
end
