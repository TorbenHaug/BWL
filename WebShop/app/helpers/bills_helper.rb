module BillsHelper
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
