module ArticlesHelper
  # Returns primary requirements analysis for passed month data in following order:
  #   1. first days of previous months
  #   2. actual sales of previous months
  #   3. target sales of previous month
  #   4. result of exponential smoothing
  #   5. result of moving average
  # get_primary_requirements_analysis_data ::= (Article, Date, Float) -> (Array[Date, Date, Date], Array[Int, Int, Int], Float, Float, Float) ::
  def get_primary_requirements_analysis_data(article, first_day, exponential_smoothing_factor)
    previous_month_count = 3
    previous_months = (1..previous_month_count).map{|index| first_day - index.month}.reverse
    
    actual_sales_of_previous_months = previous_months.map{|month|
      get_buyed_amount_in_month(article, month)
    }
    
    moving_average =
      1.0 * actual_sales_of_previous_months.reduce(:+) / previous_month_count
    
    target_sales_of_previous_month = moving_average
    
    exponential_smoothing =
      1.0 * target_sales_of_previous_month +
      exponential_smoothing_factor *
      (actual_sales_of_previous_months[-1] - target_sales_of_previous_month)
    
    return [previous_months, actual_sales_of_previous_months, target_sales_of_previous_month, exponential_smoothing, moving_average]
  end
  
  def cache_articles_and_bills(articles, bills)
    if (articles.empty?)
      Article.all.each{|item| articles[item.id] = CachedArticle.new(item.id, item.name, nil)}
      Bill.all.each{|item| bills[item.id] = CachedBill.new(item.id, item.user_id)}
      BillEntry.all.each{|item| bills[item.bill_id].add_entry(CachedBillEntry.new(bills[item.bill_id], articles[item.article_id], item.amount))}
    end
  end
  
  def association_analysis_data(min_support, min_confidence, articles, bills)
    # [left, right, bc_left, bc_right, bc_both, left2right_confidence, support]
    
    return []
  end
  
  def association_analysis_data_of(article, min_support, min_confidence, articles, bills)
    # [left, right, bc_left, bc_right, bc_both, left2right_confidence, support]
    
    return []
  end
  
  def add_to_shopping_card_helper(article_id, amount)
    article = Article.find(article_id)
    entry = ShoppingCartEntry.where(user: current_user, article: article)
    if(entry.empty?)
      ShoppingCartEntry.new(user: current_user, amount: amount, article: article).save
    else
      entry.first.amount += amount
      entry.first.save
    end
    session[:not_insert_shopping_card_entry] = nil
    redirect_to(article)
  end
end
