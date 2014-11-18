module BillsHelper
  def get_bills(articles)
    article_bills = articles.map{|article|
      BillEntry.where(:article => article).map{|entry| entry.bill}.uniq}
    result = article_bills.reduce([]){|accu, entry| accu & entry}
    return result
  end
  
  def get_bill_count(articles)
    return get_bills(articles).count
  end
  
  def get_buyed_amount(article)
    BillEntry.where(:article => article).reduce(0){|accu, entry|
      accu + entry.amount
    }
  end
  
  def get_buyed_amount_in_month(article, first_day)
    last_day = first_day.end_of_month
    
    BillEntry.where(:article => article).reduce(0){|accu, entry|
      is_in_month = (first_day.to_date..last_day.to_date).include?(entry.updated_at.to_date)
      (is_in_month) ? (accu + entry.amount) : (accu)
    }
  end
end
