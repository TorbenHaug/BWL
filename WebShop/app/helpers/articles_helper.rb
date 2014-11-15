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
  
  # Returns primary requirements analysis data in following order:
  #   1. first day of following month
  #   2. actual sales of previous months
  #   3. target sales of previous month
  #   4. result of exponential smoothing
  #   5. result of moving average
  # get_primary_requirements_analysis_data ::= (Article, Date) -> (Date, Array[Int, Int, Int], Float, Float, Float) ::
  def get_primary_requirements_analysis_data(article, first_day)
    return [Date.new(2014,12,1), [1, 2, 3], 4.0, 5.0, 6.0]
  end
end
