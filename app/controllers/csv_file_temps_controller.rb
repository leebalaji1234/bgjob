class CsvFileTempsController < ApplicationController
  before_action :set_csv_file_temp, only: [:show, :edit, :update, :destroy]

  # GET /csv_file_temps
  # GET /csv_file_temps.json
  def index
    @csv_file_temps = CsvFileTemp.all
  end

  # GET /csv_file_temps/1
  # GET /csv_file_temps/1.json
  def show
  end

  # GET /csv_file_temps/new
  def new
    @csv_file_temp = CsvFileTemp.new
  end

  # GET /csv_file_temps/1/edit
  def edit
  end

  # POST /csv_file_temps
  # POST /csv_file_temps.json
  def create
    @csv_file_temp = CsvFileTemp.new(csv_file_temp_params)

    respond_to do |format|
      if @csv_file_temp.save
        format.html { redirect_to @csv_file_temp, notice: 'Csv file temp was successfully created.' }
        format.json { render :show, status: :created, location: @csv_file_temp }
      else
        format.html { render :new }
        format.json { render json: @csv_file_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csv_file_temps/1
  # PATCH/PUT /csv_file_temps/1.json
  def update
    respond_to do |format|
      if @csv_file_temp.update(csv_file_temp_params)
        format.html { redirect_to @csv_file_temp, notice: 'Csv file temp was successfully updated.' }
        format.json { render :show, status: :ok, location: @csv_file_temp }
      else
        format.html { render :edit }
        format.json { render json: @csv_file_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csv_file_temps/1
  # DELETE /csv_file_temps/1.json
  def destroy
    @csv_file_temp.destroy
    respond_to do |format|
      format.html { redirect_to csv_file_temps_url, notice: 'Csv file temp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csv_file_temp
      @csv_file_temp = CsvFileTemp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def csv_file_temp_params
      params.require(:csv_file_temp).permit(:filename, :flocation, :fsize, :status)
    end
end
