class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def test
    
    #test1 = Article.new(name: "bla1", price: 12.2)
    #test1.save

    #test2 = Article.new(name: "bla2", price: 12.2)
    #test2.save

    #struct = ArticleStructure.new(upper_part: test1, lower_part: test2, amount: 2)
    #struct.save
    
    render text: ArticleStructure.find(1).upper_part.name.to_s
  end
end
