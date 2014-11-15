module BillsHelper
  def get_bills(articles)
    article_bills = articles.map{|article|
      BillEntry.where(:article => article).map{|entry| entry.bill}.uniq}
    return article_bills.reduce(:&)
  end
  
  def get_bill_count(articles)
    bills = get_bills(articles)
    return (bills.nil?) ? (0) : (bills.count)
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
