class RequestReceiversController < ApplicationController
  before_action :set_request_receiver, only: [:show, :edit, :update, :destroy]

  # GET /request_receivers
  # GET /request_receivers.json
  def index
    @request_receivers = RequestReceiver.all
  end

  # GET /request_receivers/1
  # GET /request_receivers/1.json
  def show
  end

  # GET /request_receivers/new
  def new
    @request_receiver = RequestReceiver.new
  end

  # GET /request_receivers/1/edit
  def edit
  end

  # POST /request_receivers
  # POST /request_receivers.json
  def create
    @request_receiver = RequestReceiver.new(request_receiver_params)

    respond_to do |format|
      if @request_receiver.save
        format.html { redirect_to @request_receiver, notice: 'Request receiver was successfully created.' }
        format.json { render :show, status: :created, location: @request_receiver }
      else
        format.html { render :new }
        format.json { render json: @request_receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_receivers/1
  # PATCH/PUT /request_receivers/1.json
  def update
    respond_to do |format|
      if @request_receiver.update(request_receiver_params)
        format.html { redirect_to @request_receiver, notice: 'Request receiver was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_receiver }
      else
        format.html { render :edit }
        format.json { render json: @request_receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_receivers/1
  # DELETE /request_receivers/1.json
  def destroy
    @request_receiver.destroy
    respond_to do |format|
      format.html { redirect_to request_receivers_url, notice: 'Request receiver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_receiver
      @request_receiver = RequestReceiver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_receiver_params
      params.require(:request_receiver).permit(:ori_params, :val_params, :message, :code, :guid, :status)
    end
end
