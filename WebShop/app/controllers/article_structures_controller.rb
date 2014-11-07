class ArticleStructuresController < ApplicationController
  before_action :set_article_structure, only: [:show, :edit, :update, :destroy]

  # GET /article_structures
  # GET /article_structures.json
  def index
    @article_structures = ArticleStructure.all
  end

  # GET /article_structures/1
  # GET /article_structures/1.json
  def show
  end

  # GET /article_structures/new
  def new
    @article_structure = ArticleStructure.new
  end

  # GET /article_structures/1/edit
  def edit
  end

  # POST /article_structures
  # POST /article_structures.json
  def create
    @article_structure = ArticleStructure.new(article_structure_params)

    respond_to do |format|
      if @article_structure.save
        format.html { redirect_to @article_structure, notice: 'Article structure was successfully created.' }
        format.json { render :show, status: :created, location: @article_structure }
      else
        format.html { render :new }
        format.json { render json: @article_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_structures/1
  # PATCH/PUT /article_structures/1.json
  def update
    respond_to do |format|
      if @article_structure.update(article_structure_params)
        format.html { redirect_to @article_structure, notice: 'Article structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_structure }
      else
        format.html { render :edit }
        format.json { render json: @article_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_structures/1
  # DELETE /article_structures/1.json
  def destroy
    @article_structure.destroy
    respond_to do |format|
      format.html { redirect_to article_structures_url, notice: 'Article structure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_structure
      @article_structure = ArticleStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_structure_params
      params.require(:article_structure).permit(:amount, :deleted_at)
    end
end
