class AudioMapsController < ApplicationController
  before_action :set_audio_map, only: [:show, :edit, :update, :destroy]

  # GET /audio_maps
  # GET /audio_maps.json
  def index
    @audio_maps = AudioMap.all
  end

  # GET /audio_maps/1
  # GET /audio_maps/1.json
  def show
  end

  # GET /audio_maps/new
  def new
    @audio_map = AudioMap.new
  end

  # GET /audio_maps/1/edit
  def edit
  end

  # POST /audio_maps
  # POST /audio_maps.json
  def create
    @audio_map = AudioMap.new(audio_map_params)

    respond_to do |format|
      if @audio_map.save
        format.html { redirect_to @audio_map, notice: 'Audio map was successfully created.' }
        format.json { render :show, status: :created, location: @audio_map }
      else
        format.html { render :new }
        format.json { render json: @audio_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_maps/1
  # PATCH/PUT /audio_maps/1.json
  def update
    respond_to do |format|
      if @audio_map.update(audio_map_params)
        format.html { redirect_to @audio_map, notice: 'Audio map was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio_map }
      else
        format.html { render :edit }
        format.json { render json: @audio_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_maps/1
  # DELETE /audio_maps/1.json
  def destroy
    @audio_map.destroy
    respond_to do |format|
      format.html { redirect_to audio_maps_url, notice: 'Audio map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_map
      @audio_map = AudioMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_map_params
      params.require(:audio_map).permit(:userid, :audioid, :guid, :cliporder, :status)
    end
end
