class CsvMapsController < ApplicationController
  before_action :set_csv_map, only: [:show, :edit, :update, :destroy]

  # GET /csv_maps
  # GET /csv_maps.json
  def index
    @csv_maps = CsvMap.all
  end

  # GET /csv_maps/1
  # GET /csv_maps/1.json
  def show
  end

  # GET /csv_maps/new
  def new
    @csv_map = CsvMap.new
  end

  # GET /csv_maps/1/edit
  def edit
  end

  # POST /csv_maps
  # POST /csv_maps.json
  def create
    @csv_map = CsvMap.new(csv_map_params)

    respond_to do |format|
      if @csv_map.save
        format.html { redirect_to @csv_map, notice: 'Csv map was successfully created.' }
        format.json { render :show, status: :created, location: @csv_map }
      else
        format.html { render :new }
        format.json { render json: @csv_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csv_maps/1
  # PATCH/PUT /csv_maps/1.json
  def update
    respond_to do |format|
      if @csv_map.update(csv_map_params)
        format.html { redirect_to @csv_map, notice: 'Csv map was successfully updated.' }
        format.json { render :show, status: :ok, location: @csv_map }
      else
        format.html { render :edit }
        format.json { render json: @csv_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csv_maps/1
  # DELETE /csv_maps/1.json
  def destroy
    @csv_map.destroy
    respond_to do |format|
      format.html { redirect_to csv_maps_url, notice: 'Csv map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csv_map
      @csv_map = CsvMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def csv_map_params
      params.require(:csv_map).permit(:userid, :csvid, :guid, :status)
    end
end
