require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @review = @user.reviews.build(title: "Dune", author: "Frank Herbert",
                         content: "Blue within blue")
  end

  test "should be valid" do 
    assert @review.valid?
  end
  
  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test "content should be present" do
    @review.content = "      "
    assert_not @review.valid?
  end

  test "title should be present" do
    @review.title = "        "
    assert_not @review.valid?
  end

  test "author should be present" do 
    @review.author = "      "
    assert_not @review.valid?
  end

  test "content should be at most 600 characters" do
    @review.content = "a"*601
    assert_not @review.valid?
  end

  test "order should be most recent first" do
    assert_equal reviews(:most_recent), Review.first
  end
end
