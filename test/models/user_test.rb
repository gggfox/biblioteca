require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", 
                     password: "footbars", password_confirmation: "footbars")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "user name should not be empty" do
    @user.name = "            "
    assert_not  @user.valid?
  end

  test "email should be present" do
    @user.email = "           "
    assert_not @user.valid?
  end 

  test "user name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "user email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "should accept valid email addresses" do
    valid_emails = %w[user@mail.com US.ER@mail.COM A_E+U-MX@g.mail.org]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email.inspect} should be valid."
    end
  end

  test "should NOT accept invalid email addresses" do
    invalid_emails = %w[user@ma+il.com user@mail,com user@@.com]
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should NOT be valid"
    end
  end
  
  test "emails should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "should have nonblank password" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have at least 8 characters" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "associated reviews should be destroyed" do
    @user.save
    @user.reviews.create!(title:"Lorem", author:"ipsum" ,content: "Lorem ipsum")
    assert_difference 'Review.count', -1 do
      @user.destroy
    end
  end
end
