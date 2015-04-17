class RequestReceiverTempsController < ApplicationController
  before_action :set_request_receiver_temp, only: [:show, :edit, :update, :destroy]

  # GET /request_receiver_temps
  # GET /request_receiver_temps.json
  def index
    @request_receiver_temps = RequestReceiverTemp.all
  end

  # GET /request_receiver_temps/1
  # GET /request_receiver_temps/1.json
  def show
  end

  # GET /request_receiver_temps/new
  def new
    @request_receiver_temp = RequestReceiverTemp.new
  end

  # GET /request_receiver_temps/1/edit
  def edit
  end

  # POST /request_receiver_temps
  # POST /request_receiver_temps.json
  def create
    @request_receiver_temp = RequestReceiverTemp.new(request_receiver_temp_params)

    respond_to do |format|
      if @request_receiver_temp.save
        format.html { redirect_to @request_receiver_temp, notice: 'Request receiver temp was successfully created.' }
        format.json { render :show, status: :created, location: @request_receiver_temp }
      else
        format.html { render :new }
        format.json { render json: @request_receiver_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_receiver_temps/1
  # PATCH/PUT /request_receiver_temps/1.json
  def update
    respond_to do |format|
      if @request_receiver_temp.update(request_receiver_temp_params)
        format.html { redirect_to @request_receiver_temp, notice: 'Request receiver temp was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_receiver_temp }
      else
        format.html { render :edit }
        format.json { render json: @request_receiver_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_receiver_temps/1
  # DELETE /request_receiver_temps/1.json
  def destroy
    @request_receiver_temp.destroy
    respond_to do |format|
      format.html { redirect_to request_receiver_temps_url, notice: 'Request receiver temp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_receiver_temp
      @request_receiver_temp = RequestReceiverTemp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_receiver_temp_params
      params.require(:request_receiver_temp).permit(:params, :status)
    end
end
