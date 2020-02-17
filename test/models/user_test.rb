require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @sebas = users(:sebas)
    @maxisun = users(:maxisun)
  end
    
  test "is not a valid user" do
    assert @sebas.valid?, "user is invalid"
  end

  test "username must be present" do
    user_test = User.new(username: nil, email: "max@gmai.com")
    assert user_test.invalid?, "username is not present"
  end

  test "username must be more than 3 characters" do
    user_test = User.new(username: "a", email: "max@gmai.com")
    assert user_test.invalid?, "username is less than 3 characters"
  end

  test "username must be less than 25 characters" do
    user_test = User.new(username: "123456789012345678901234567", email: "max@gmai.com")
    assert user_test.invalid?, "username is more than 25 characters"
  end

  test "username must be unique" do
    user_test = User.new(username: @sebas.username, email: "max@gmail.com")
    assert user_test.invalid?, "username has already been taken"
  end

  test "email must be present" do
    user_test = User.new(username: "lolis", email: nil)
    assert user_test.invalid?, "email is not present"
  end

  test "email must be unique" do
    user_test = User.new(username: "lolis", email: @sebas.email)
    assert user_test.invalid?, "email has already been taken"
  end

end