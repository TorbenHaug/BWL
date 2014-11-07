class ArticleToTagsController < ApplicationController
  before_action :set_article_to_tag, only: [:show, :edit, :update, :destroy]

  # GET /article_to_tags
  # GET /article_to_tags.json
  def index
    @article_to_tags = ArticleToTag.all
  end

  # GET /article_to_tags/1
  # GET /article_to_tags/1.json
  def show
  end

  # GET /article_to_tags/new
  def new
    @article_to_tag = ArticleToTag.new
  end

  # GET /article_to_tags/1/edit
  def edit
  end

  # POST /article_to_tags
  # POST /article_to_tags.json
  def create
    @article_to_tag = ArticleToTag.new(article_to_tag_params)

    respond_to do |format|
      if @article_to_tag.save
        format.html { redirect_to @article_to_tag, notice: 'Article to tag was successfully created.' }
        format.json { render :show, status: :created, location: @article_to_tag }
      else
        format.html { render :new }
        format.json { render json: @article_to_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_to_tags/1
  # PATCH/PUT /article_to_tags/1.json
  def update
    respond_to do |format|
      if @article_to_tag.update(article_to_tag_params)
        format.html { redirect_to @article_to_tag, notice: 'Article to tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_to_tag }
      else
        format.html { render :edit }
        format.json { render json: @article_to_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_to_tags/1
  # DELETE /article_to_tags/1.json
  def destroy
    @article_to_tag.destroy
    respond_to do |format|
      format.html { redirect_to article_to_tags_url, notice: 'Article to tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_to_tag
      @article_to_tag = ArticleToTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_to_tag_params
      params[:article_to_tag]
    end
end
