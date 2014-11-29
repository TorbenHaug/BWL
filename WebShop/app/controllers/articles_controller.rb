class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-6.8.9-Q16'
  
  def association_analysis
    render template: 'articles/associations'
  end

  def add_to_shopping_card
    article = Article.find(params[:article_id].to_i)
    entry = ShoppingCartEntry.where(user: current_user, article: article)
    if(entry.empty?)
      ShoppingCartEntry.new(user: current_user, amount: params[:amount].to_i, article: Article.find(params[:article_id].to_i)).save
    else
      entry.first.amount += params[:amount].to_i
      entry.first.save
    end

    redirect_to(:back)
    #render text: params.to_s
  end

  def by_menu
    set_menu_id(params[:menu_id])
    #flash[:notice] = Menu.find(get_menu_id).all_tags.inject(""){|accu,obj| accu = accu + obj.name.to_s + ", "; accu}
    #@articles = Menu.find(get_menu_id).all_sub_tags.inject(Set.new) { |accu, obj| accu + obj.articles }
    top_tags = Menu.find(get_menu_id).all_top_tags
    if !top_tags.empty?
      @articles = top_tags.inject(top_tags.first.articles.to_set) { |accu, obj| obj.articles.to_set & accu }
    else
      @articles = Article.all
    end
    render template: 'articles/index'
  end
  
  def search
    searchqueries = params[:q].split(' ')
    searchpattern = searchqueries.map { |obj| "(name like '%#{obj}%' OR description like '%#{obj}%')"}.join(" AND ")
    @articles = Article.where(searchpattern)
    render template: 'articles/index'
  end

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.save
    @article.tag_ids = params[:article][:tag_ids].nil? or params[:article][:tag_ids].empty? ? nil : params[:article][:tag_ids].map { |obj| obj.to_i}
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    @article.tag_ids = params[:article][:tag_ids].nil? or params[:article][:tag_ids].empty? ? nil : params[:article][:tag_ids].map { |obj| obj.to_i}
    @article.save
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if (@article.deleted_at.nil?)
      @article.deleted_at = Time.zone.now
      @article.save

      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'WARNING: Article was already destroyed!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :description, :price, :deleted_at, :photo, :tag_ids)
    end

end
