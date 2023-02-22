# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test"should not save item without a name" do
      item = Item.new
      assert_not item.save, "Saved item without name"
    end

    test "should save item with a name" do
      item = Item.new(name: "Test")
      assert item.save, "Saved item with name"
    end
end
