# frozen_string_literal: true

require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get home page" do
    get 'main#home'
    assert_response :success
  end
end
