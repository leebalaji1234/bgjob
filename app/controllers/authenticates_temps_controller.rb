class AuthenticatesTempsController < ApplicationController
  before_action :set_authenticates_temp, only: [:show, :edit, :update, :destroy]

  # GET /authenticates_temps
  # GET /authenticates_temps.json
  def index
    @authenticates_temps = AuthenticatesTemp.all
  end

  # GET /authenticates_temps/1
  # GET /authenticates_temps/1.json
  def show
  end

  # GET /authenticates_temps/new
  def new
    @authenticates_temp = AuthenticatesTemp.new
  end

  # GET /authenticates_temps/1/edit
  def edit
  end

  # POST /authenticates_temps
  # POST /authenticates_temps.json
  def create
    @authenticates_temp = AuthenticatesTemp.new(authenticates_temp_params)

    respond_to do |format|
      if @authenticates_temp.save
        format.html { redirect_to @authenticates_temp, notice: 'Authenticates temp was successfully created.' }
        format.json { render :show, status: :created, location: @authenticates_temp }
      else
        format.html { render :new }
        format.json { render json: @authenticates_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authenticates_temps/1
  # PATCH/PUT /authenticates_temps/1.json
  def update
    respond_to do |format|
      if @authenticates_temp.update(authenticates_temp_params)
        format.html { redirect_to @authenticates_temp, notice: 'Authenticates temp was successfully updated.' }
        format.json { render :show, status: :ok, location: @authenticates_temp }
      else
        format.html { render :edit }
        format.json { render json: @authenticates_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authenticates_temps/1
  # DELETE /authenticates_temps/1.json
  def destroy
    @authenticates_temp.destroy
    respond_to do |format|
      format.html { redirect_to authenticates_temps_url, notice: 'Authenticates temp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authenticates_temp
      @authenticates_temp = AuthenticatesTemp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authenticates_temp_params
      params.require(:authenticates_temp).permit(:params, :status, :guid)
    end
end
