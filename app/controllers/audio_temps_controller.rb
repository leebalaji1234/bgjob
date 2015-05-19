class AudioTempsController < ApplicationController
  before_action :set_audio_temp, only: [:show, :edit, :update, :destroy]

  # GET /audio_temps
  # GET /audio_temps.json
  def index
    @audio_temps = AudioTemp.all
  end

  # GET /audio_temps/1
  # GET /audio_temps/1.json
  def show
  end

  # GET /audio_temps/new
  def new
    @audio_temp = AudioTemp.new
  end

  # GET /audio_temps/1/edit
  def edit
  end

  # POST /audio_temps
  # POST /audio_temps.json
  def create
    @audio_temp = AudioTemp.new(audio_temp_params)

    respond_to do |format|
      if @audio_temp.save
        format.html { redirect_to @audio_temp, notice: 'Audio temp was successfully created.' }
        format.json { render :show, status: :created, location: @audio_temp }
      else
        format.html { render :new }
        format.json { render json: @audio_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_temps/1
  # PATCH/PUT /audio_temps/1.json
  def update
    respond_to do |format|
      if @audio_temp.update(audio_temp_params)
        format.html { redirect_to @audio_temp, notice: 'Audio temp was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio_temp }
      else
        format.html { render :edit }
        format.json { render json: @audio_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_temps/1
  # DELETE /audio_temps/1.json
  def destroy
    @audio_temp.destroy
    respond_to do |format|
      format.html { redirect_to audio_temps_url, notice: 'Audio temp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_temp
      @audio_temp = AudioTemp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_temp_params
      params.require(:audio_temp).permit(:audioname, :flocation, :fsize, :ftlocation, :status)
    end
end
