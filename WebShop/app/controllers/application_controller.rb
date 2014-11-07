class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def test
    
    test1 = Article.new(name: "bla1", price: 12.2)
    test1.save

    test2 = Article.new(name: "bla2", price: 12.2)
    test2.save

    struct = ArticleStructure.new(upper_part: test1, lower_part: test2, amount: 2)
    struct.save

    article1 = Article.find(1)
    article2 = Article.find(2)
    render text: ArticleStructure.where(upper_part: article1, lower_part: article2).first.lower_part.name
    
    t1 = Tag.new(:name => "...t1")
    t1.save
    t2 = Tag.new(:name => "...t2")
    t2.save
    t3 = Tag.new(:name => "...t3")
    t3.save
    
    m1 = Menu.new(:name => "...m1")
    m1.save
    m2 = Menu.new(:name => "...m1")
    m2.save
    
    MenuToTag.new(:menu => m1, :tag => t1).save
    MenuToTag.new(:menu => m1, :tag => t2).save
    MenuToTag.new(:menu => m2, :tag => t2).save
    MenuToTag.new(:menu => m2, :tag => t3).save
  end
end
