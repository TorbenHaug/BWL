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
  
  # caching
  @@cached_articles = {}
  @@cached_bills = {}
  
  def get_cached_article(article)
    @@cached_articles[article.id]
  end
  
  def get_cached_bill(bill)
    @@cached_bills[bill.id]
  end
  
  def cache_articles_and_bills(force)
    if (@@cached_articles.empty? || force)
      @@cached_articles = {}
      @@cached_bills = {}
      
      Article.all.each{|item| @@cached_articles[item.id] = CachedArticle.new(item.id, item.name, "<a href=\"http://127.0.0.1:3000/articles/#{item.id}\">LINK_DESCRIPTION</a>")}
      Bill.all.each{|item| @@cached_bills[item.id] = CachedBill.new(item.id, item.user_id)}
      BillEntry.all.each{|item| @@cached_bills[item.bill_id].add_entry(CachedBillEntry.new(@@cached_bills[item.bill_id], @@cached_articles[item.article_id], item.amount))}
    end
  end
  
  # association analysis
  def get_bill_count_all
    return @@cached_bills.size
  end
  
  def get_bills(articles)
    article_bills = articles.map{|article|
      @@cached_bills.values.select{|bill|
        bill.entry_data.any?{|entry|
          entry.article_data == article
        }
      }
    }
    
    result = article_bills.reduce(:&)
    (result.nil?) ? ([]) : (result.to_a)
  end
  
  def get_bill_count(articles)
    return get_bills(articles).size
  end
  
  def get_support(articles)
    bc_all = get_bill_count_all
    bc_articles = get_bill_count(articles)
    
    support = (bc_all != 0) ? (100.0 * bc_articles / bc_all) : (0.0)
    
    return support
  end
  
  def get_article_sets(min_support)
    articles = @@cached_articles.values.reject{|article| get_support([article]) < min_support}

    # Generate sets with one article
    results = articles.map{|article| [article]}

    # Generate sets with at least two articles
    results.each{|result|
      articles.each{|article|
        if (!result.include?(article))
          new_result = (result | [article]).to_set

          if (!results.include?(new_result) && get_support(new_result) >= min_support)
            results.push(new_result)
          end
        end
      }
    }

    return results
  end
  
  def get_partitions(set)
    yield [] if set.empty?
    (0 ... 2 ** set.size / 2).each do |i|
      parts = [[], []]
      set.each do |item|
        parts[i & 1] << item
        i >>= 1
      end
      get_partitions(parts[1]) do |b|
        result = [parts[0]] + b
        result = result.reject do |e|
          e.empty?
        end
        yield result
      end
    end
  end
  
  def association_analysis_data(min_support, min_confidence)
    article_sets = get_article_sets(min_support)
    bc_all = get_bill_count_all

    result = []
    article_sets.each{|item|
      get_partitions(item.to_set){|partition|
        if (partition.size == 2)
          left = partition[0]
          right = partition[1]

          bc_left = get_bill_count(left)
          bc_right = get_bill_count(right)

          bc_both = get_bill_count(left | right)
          support = (bc_all != 0) ? (100.0 * bc_both / bc_all) : (0.0)

          left_to_right_confidence = (bc_left != 0) ? (100.0 * bc_both / bc_left) : (0.0)
          if (left_to_right_confidence >= min_confidence)
            result.push([left, right, bc_left, bc_right, bc_both, left_to_right_confidence, support])
          end

          right_to_left_confidence = (bc_right != 0) ? (100.0 * bc_both / bc_right) : (0.0)
          if (right_to_left_confidence >= min_confidence)
            result.push([right, left, bc_right, bc_left, bc_both, right_to_left_confidence, support])
          end
        end
      }
    }
    
    # Sort by articles
    result.sort!

    # Sort by confidence and support
    result.sort!{|a, b|
        temp = b[5] <=> a[5]
        (temp == 0) ? (b[6] <=> a[6]) : temp}
    return result
  end
  
  def association_analysis_data_of(left, min_support, min_confidence)
    bc_all = get_bill_count_all
    
    left = [left]
    bc_left = get_bill_count(left)

    result = []
    @@cached_articles.values.each{|article|
      right = [article]
      bc_right = get_bill_count(right)

      bc_both = get_bill_count(left | right)
      support = (bc_all != 0) ? (100.0 * bc_both / bc_all) : (0.0)
      if (support >= min_support)
        left_to_right_confidence = (bc_left != 0) ? (100.0 * bc_both / bc_left) : (0.0)
        if (left_to_right_confidence >= min_confidence)
          result.push([left, right, bc_left, bc_right, bc_both, left_to_right_confidence, support])
        end
      end
    }
    
    # Sort by articles
    result.sort!

    # Sort by confidence and support
    result.sort!{|a, b|
        temp = b[5] <=> a[5]
        (temp == 0) ? (b[6] <=> a[6]) : temp}
    return result
  end
  
  # shopping card
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

class CachedBill
  def initialize(id, user_id)
    @id = id
    @user_id = user_id
    @entry_data = []
  end
  
  attr_reader :id
  attr_reader :user_id
  attr_reader :entry_data
  
  def add_entry(entry_data)
    @entry_data.push(entry_data)
  end
  
  def to_s
    return "B" + @id.to_s
  end
  
  def <=>(o)
    return self.id <=> o.id
  end
end

class CachedBillEntry
  def initialize(bill_data, article_data, amount)
    @bill_data = bill_data
    @article_data = article_data
    @amount = amount
  end
  
  attr_reader :bill_data
  attr_reader :article_data
  attr_reader :amount
end

class CachedArticle
  def initialize(id, name, link_to)
    @id = id
    @name = name
    @link_to = link_to
  end
  
  attr_reader :id
  attr_reader :name
  
  def link_to(description)
    return @link_to.sub("LINK_DESCRIPTION", description).html_safe
  end
  
  def to_s
    return "A" + @id.to_s
  end
  
  def <=>(o)
    return self.id <=> o.id
  end
end
