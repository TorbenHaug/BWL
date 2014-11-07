class MenuToTagsController < ApplicationController
  before_action :set_menu_to_tag, only: [:show, :edit, :update, :destroy]

  # GET /menu_to_tags
  # GET /menu_to_tags.json
  def index
    @menu_to_tags = MenuToTag.all
  end

  # GET /menu_to_tags/1
  # GET /menu_to_tags/1.json
  def show
  end

  # GET /menu_to_tags/new
  def new
    @menu_to_tag = MenuToTag.new
  end

  # GET /menu_to_tags/1/edit
  def edit
  end

  # POST /menu_to_tags
  # POST /menu_to_tags.json
  def create
    @menu_to_tag = MenuToTag.new(menu_to_tag_params)

    respond_to do |format|
      if @menu_to_tag.save
        format.html { redirect_to @menu_to_tag, notice: 'Menu to tag was successfully created.' }
        format.json { render :show, status: :created, location: @menu_to_tag }
      else
        format.html { render :new }
        format.json { render json: @menu_to_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_to_tags/1
  # PATCH/PUT /menu_to_tags/1.json
  def update
    respond_to do |format|
      if @menu_to_tag.update(menu_to_tag_params)
        format.html { redirect_to @menu_to_tag, notice: 'Menu to tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_to_tag }
      else
        format.html { render :edit }
        format.json { render json: @menu_to_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_to_tags/1
  # DELETE /menu_to_tags/1.json
  def destroy
    @menu_to_tag.destroy
    respond_to do |format|
      format.html { redirect_to menu_to_tags_url, notice: 'Menu to tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_to_tag
      @menu_to_tag = MenuToTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_to_tag_params
      params[:menu_to_tag]
    end
end
