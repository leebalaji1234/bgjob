class OptinServicesController < ApplicationController
  before_action :set_optin_service, only: [:show, :edit, :update, :destroy]

  # GET /optin_services
  # GET /optin_services.json
  def index
    @optin_services = OptinService.all
  end

  # GET /optin_services/1
  # GET /optin_services/1.json
  def show
  end

  # GET /optin_services/new
  def new
    @optin_service = OptinService.new
  end

  # GET /optin_services/1/edit
  def edit
  end

  # POST /optin_services
  # POST /optin_services.json
  def create
    @optin_service = OptinService.new(optin_service_params)

    respond_to do |format|
      if @optin_service.save
        format.html { redirect_to @optin_service, notice: 'Optin service was successfully created.' }
        format.json { render :show, status: :created, location: @optin_service }
      else
        format.html { render :new }
        format.json { render json: @optin_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /optin_services/1
  # PATCH/PUT /optin_services/1.json
  def update
    respond_to do |format|
      if @optin_service.update(optin_service_params)
        format.html { redirect_to @optin_service, notice: 'Optin service was successfully updated.' }
        format.json { render :show, status: :ok, location: @optin_service }
      else
        format.html { render :edit }
        format.json { render json: @optin_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /optin_services/1
  # DELETE /optin_services/1.json
  def destroy
    @optin_service.destroy
    respond_to do |format|
      format.html { redirect_to optin_services_url, notice: 'Optin service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_optin_service
      @optin_service = OptinService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def optin_service_params
      params.require(:optin_service).permit(:phone, :status)
    end
end
