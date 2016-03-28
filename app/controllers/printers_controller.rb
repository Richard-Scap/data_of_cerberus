class PrintersController < ApplicationController
  before_action :set_printer, only: [:show, :edit, :update, :destroy]

  # GET /printers
  # GET /printers.json
  def index
    @printers = Printer.all
  end

  # GET /printers/1
  # GET /printers/1.json
  def show
  end

  # GET /printers/new
  def new
    @printer = Printer.new
  end

  # GET /printers/1/edit
  def edit
  end

  # POST /printers
  # POST /printers.json
  def create
    # TODO get classes working
    # TODO move phone_numbers into its own worker
    # TODO move the phone_number.each logic into a sidekiq worker

    YelpWorker.perform_async(params[:city_id])

    redirect_to :root
  end

  # PATCH/PUT /printers/1
  # PATCH/PUT /printers/1.json
  def update
    
  end

  # DELETE /printers/1
  # DELETE /printers/1.json
  def destroy
    @printer.destroy
    respond_to do |format|
      format.html { redirect_to printers_url, notice: 'Printer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printer
      @printer = Printer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def printer_params
      params.fetch(:printer, {})
    end
end
