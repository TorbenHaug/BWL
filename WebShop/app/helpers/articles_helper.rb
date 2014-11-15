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
end
