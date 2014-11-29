class ShoppingCartEntriesController < ApplicationController
  before_action :set_shopping_cart_entry, only: [:show, :edit, :update, :destroy]

  # GET /shopping_cart_entries
  # GET /shopping_cart_entries.json
  def index
    @shopping_cart_entries = ShoppingCartEntry.where(user: current_user)
  end

  def buy
    my_bill = Bill.new(user: current_user)
    my_bill.save
    @shopping_cart_entries = ShoppingCartEntry.where(user: current_user)
    @shopping_cart_entries.each do |entry|
      BillEntry.new(bill: my_bill, article: entry.article, amount: entry.amount).save
      entry.destroy
    end

    redirect_to shoppingcard_path
  end
  # # GET /shopping_cart_entries/1
  # # GET /shopping_cart_entries/1.json
  # def show
  # end
  #
  # GET /shopping_cart_entries/new
  def new
    @shopping_cart_entry = ShoppingCartEntry.new
  end

  # GET /shopping_cart_entries/1/edit
  # def edit
  # end
  #
  # # POST /shopping_cart_entries
  # # POST /shopping_cart_entries.json
  def create
    @shopping_cart_entry = ShoppingCartEntry.new(shopping_cart_entry_params)

    respond_to do |format|
      if @shopping_cart_entry.save
        format.html { redirect_to @shopping_cart_entry, notice: 'Shopping cart entry was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_cart_entry }
      else
        format.html { render :new }
        format.json { render json: @shopping_cart_entry.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  # PATCH/PUT /shopping_cart_entries/1
  # PATCH/PUT /shopping_cart_entries/1.json
  def update
    respond_to do |format|
      if @shopping_cart_entry.update(shopping_cart_entry_params)
        format.html { redirect_to shoppingcard_path, notice: 'Shopping cart entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_cart_entry }
      else
        format.html { render :edit }
        format.json { render json: @shopping_cart_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_cart_entries/1
  # DELETE /shopping_cart_entries/1.json
  def destroy
    @shopping_cart_entry.destroy
    respond_to do |format|
      format.html { redirect_to shopping_cart_entries_url, notice: 'Shopping cart entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart_entry
      @shopping_cart_entry = ShoppingCartEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_cart_entry_params
      params.require(:shopping_cart_entry).permit(:amount)
    end
end
