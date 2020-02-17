require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:mafer)
    @bad_title = articles(:bad_title)
    @bad_description = articles(:bad_description)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get root/home page" do
    get root_url
    assert_response :success
  end

  test "should get about page" do
    get about_url
    assert_response :success
  end

  test "should get articles page" do
    get articles_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { title: @article.title, description: @article.description } }
    end
    assert_redirected_to article_url(Article.last)
    assert_equal 'Article was successfully created', flash[:success]
  end

  test "should get new article page" do
    get new_article_url
    assert_response :success
  end

  test "should get edit article" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should update article" do
    updated_title = "Susana"
    updated_description = "Pendeja Chupa Pene."
    patch article_url(@article), params: { article: { title: updated_title, description: updated_description } }
    assert_redirected_to article_url(@article)
    assert_equal 'Article was successfully updated', flash[:success]
    @article.reload
    assert_equal updated_title, @article.title
    assert_equal updated_description, @article.description
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end
    assert_redirected_to articles_url
    assert_equal 'Article was successfully deleted', flash[:danger]
  end

end