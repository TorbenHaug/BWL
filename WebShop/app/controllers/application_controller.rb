class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def test
    # reset everything
    Tag.destroy_all
    Menu.destroy_all
    Article.destroy_all
    
    # create tags
    tags = [Tag.new(:name => "...t1"),
      Tag.new(:name => "...t2"),
      Tag.new(:name => "...t3")]
    tags.each { |i| i.save }
    
    # create menus
    menus = [Menu.new(:name => "...m1"),
      Menu.new(:name => "...m2"),
      Menu.new(:name => "...m3")]
    menus.each { |i| i.save }
    
    # create articles
    articles = [Article.new(:name => "...p1", price: 12.2),
      Article.new(:name => "...p2", price: 12.2),
      Article.new(:name => "...p3", price: 12.2)]
    articles.each { |i| i.save }
    
    # create structure
    struct = ArticleStructure.new(upper_part: articles[0], lower_part: articles[1], amount: 2)
    struct.save

    render text: "..."
    
    MenuToTag.new(:menu => menus[0], :tag => tags[0]).save
    MenuToTag.new(:menu => menus[0], :tag => tags[1]).save
    MenuToTag.new(:menu => menus[1], :tag => tags[1]).save
    MenuToTag.new(:menu => menus[1], :tag => tags[2]).save
    
    ArticleToTag.new(:article => articles[0], :tag => tags[0]).save
    ArticleToTag.new(:article => articles[0], :tag => tags[1]).save
    ArticleToTag.new(:article => articles[1], :tag => tags[1]).save
    ArticleToTag.new(:article => articles[1], :tag => tags[2]).save
    
    menus[0].super_menu_id = menus[1].id
    menus[0].save
  end
end
