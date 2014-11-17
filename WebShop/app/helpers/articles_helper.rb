module ArticlesHelper
  # Returns association analysis data in following order:
  #   1. other article
  #   2. bill count of other article
  #   3. bill count of other article and passed article
  #   4. indicator: confidence
  #   5. indicator: support
  # get_association_analysis_data ::= (Article) -> (Article, Int, Int, Float, Float) ::
  def get_association_analysis_data(article)
    bc_all = Bill.count
    bc_self = get_bill_count([article])
    
    result = []
    Article.all.each{|entry|
      bc_other = get_bill_count([entry])
      bc_both = get_bill_count([article, entry])

      confidence = (bc_self != 0) ? (100.0 * bc_both / bc_self) : (0.0)
      support = (bc_all != 0) ? (100.0 * bc_both / bc_all) : (0.0)
      
      data = [entry, bc_other, bc_both, confidence, support]
      result.push(data) if (entry != @article)
    }
    
    result.sort!{|a, b|
      temp = b[3] <=> a[3]
      (temp == 0) ? (b[4] <=> a[4]) : temp}
    return result
  end
  
  # Returns primary requirements analysis for passed month data in following order:
  #   1. first days of previous months
  #   2. actual sales of previous months
  #   3. target sales of previous month
  #   4. result of exponential smoothing
  #   5. result of moving average
  # get_primary_requirements_analysis_data ::= (Article, Date, Float, Int) -> (Array[Date, Date, Date], Array[Int, Int, Int], Float, Float, Float) ::
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
end
