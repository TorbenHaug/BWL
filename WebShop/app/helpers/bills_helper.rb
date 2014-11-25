module BillsHelper
  def get_bills(articles)
    article_bills = articles.map{|article|
      BillEntry.where(:article => article).map{|entry| entry.bill}.uniq}
    result = article_bills.reduce(:&)
    result = (result.nil?) ? ([]) : (result.to_a)
    return result
  end
  
  def get_bill_count(articles)
    return get_bills(articles).count
  end
  
  def get_buyed_amount(article)
    BillEntry.where(
        :article => article).sum(:amount)
  end
  
  def get_buyed_amount_in_month(article, day_in_month)
    first_day = day_in_month.beginning_of_month
    last_day = day_in_month.end_of_month
    
    BillEntry.where(
        :article => article).where(
        :updated_at => first_day..last_day).sum(:amount)
  end
end
