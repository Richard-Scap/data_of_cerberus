class PrintersController < ApplicationController
  before_action :set_printer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /cities/:city_id/printers
  def index
    @printers = Printer.where(city_id: params[:city_id])
  end

 # GET /cities/:city_id/printers/:id
  def show
  end

  # GET /cities/:city_id/printers/new
  def new
    @printer = Printer.new
  end

  # GET /cities/:city_id/printers/:id/edit
  def edit
  end

  # POST /cities/:city_id/printers
  def create
    # TODO get classes working
    # TODO move phone_numbers into its own worker
    # TODO move the phone_number.each logic into a sidekiq worker

    YelpWorker.perform_async(params[:city_id])

    redirect_to :root
  end

  # PUT /cities/:city_id/printers/:id
  def update
    
  end

  # DELETE /cities/:city_id/printers/:id
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
