require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new({
      name: "Test User", email: "test.user@gmail.com",
      password: "test@pass12", password_confirmation: "test@pass12"
    })
  end

  test "Should be valid" do
    assert @user.valid?
  end

  test "Should name be present" do
    @user.name = "   "
    @user.email = ""
    assert_not @user.valid?
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "test@gmail.com"
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "test@gmail,com"
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password should be at least 6 characters" do
    @user.password = @user.password_confirmation = "mypas"
    assert_not @user.valid?
  end
end
