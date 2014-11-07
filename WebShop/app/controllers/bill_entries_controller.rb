class BillEntriesController < ApplicationController
  before_action :set_bill_entry, only: [:show, :edit, :update, :destroy]

  # GET /bill_entries
  # GET /bill_entries.json
  def index
    @bill_entries = BillEntry.all
  end

  # GET /bill_entries/1
  # GET /bill_entries/1.json
  def show
  end

  # GET /bill_entries/new
  def new
    @bill_entry = BillEntry.new
  end

  # GET /bill_entries/1/edit
  def edit
  end

  # POST /bill_entries
  # POST /bill_entries.json
  def create
    @bill_entry = BillEntry.new(bill_entry_params)

    respond_to do |format|
      if @bill_entry.save
        format.html { redirect_to @bill_entry, notice: 'Bill entry was successfully created.' }
        format.json { render :show, status: :created, location: @bill_entry }
      else
        format.html { render :new }
        format.json { render json: @bill_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bill_entries/1
  # PATCH/PUT /bill_entries/1.json
  def update
    respond_to do |format|
      if @bill_entry.update(bill_entry_params)
        format.html { redirect_to @bill_entry, notice: 'Bill entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_entry }
      else
        format.html { render :edit }
        format.json { render json: @bill_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_entries/1
  # DELETE /bill_entries/1.json
  def destroy
    @bill_entry.destroy
    respond_to do |format|
      format.html { redirect_to bill_entries_url, notice: 'Bill entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_entry
      @bill_entry = BillEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_entry_params
      params.require(:bill_entry).permit(:amount, :unit_price)
    end
end
