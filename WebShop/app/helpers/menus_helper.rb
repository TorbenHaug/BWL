module MenusHelper
  def get_menus_of_article(article)
    result = []
    ArticleToTag.where(:article => article).each{|article_item|
      MenuToTag.where(:tag => article_item.tag).each{|menu_item|
        result.push(menu_item.menu) if (!result.include?(menu_item.menu))
      }
    }
    result.delete(nil)
    return result
  end
  
  def get_articles_of_menu(menu)
    result = []
    MenuToTag.where(:menu => menu).each{|menu_item|
      ArticleToTag.where(:tag => menu_item.tag).each{|article_item|
        result.push(article_item.article) if (!result.include?(article_item.article))
      }
    }
    result.delete(nil)
    return result
  end
  
  def get_place_in(article, articles)
    buyed_amounts = articles.map{|entry|
      [entry, get_buyed_amount(entry)]}
    buyed_amounts.sort!{|a, b| b[1] <=> a[1]}
    
    buyed_amounts.each_with_index{|item, index|
      (return [index + 1, buyed_amounts.size]) if (item[0] == article)
    }
  end
  
  def get_place(article)
    return get_place_in(article, Article.all)
  end
  
  def get_place_at_menu(article, menu)
    return get_place_in(article, get_articles_of_menu(menu))
  end
end
