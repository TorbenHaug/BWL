rails generate scaffold User firstname:string lastname:string email:string password_digest:string remember_digest:string role:integer deleted_at:datetime --force
rails generate scaffold Tag name:string --force
rails generate scaffold Article name:string description:string price:float deleted_at:datetime --force
rails generate scaffold ArticleStructure amount:integer deleted_at:datetime --force
rails generate scaffold Menu name:string --force
rails generate scaffold ShoppingCartEntry amount:integer --force
rails generate scaffold Bill --force
rails generate scaffold BillEntry amount:integer unit_price:float --force
rails generate scaffold MenuToTag --force
rails generate scaffold ArticleToTag --force
rails generate scaffold News title:string content:text --force
pause
