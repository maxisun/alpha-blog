require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = articles(:mafer)
    @bad_title = articles(:bad_title)
    @bad_description = articles(:bad_description)
  end

  test "valid article" do
    assert @article.valid?
  end

  test "invalid title" do
    assert_not @bad_title.valid?, @bad_title.errors[:title]
  end

  test "invalid description" do
    assert_not @bad_description.valid?, @bad_description.errors[:title]
  end
end