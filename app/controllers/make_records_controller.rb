class MakeRecordsController < ApplicationController
  before_action :set_make_record, only: [:show, :edit, :update, :destroy]

  # GET /make_records
  # GET /make_records.json
  def index
    @make_records = MakeRecord.all
  end

  # GET /make_records/1
  # GET /make_records/1.json
  def show
  end

  # GET /make_records/new
  def new
    @make_record = MakeRecord.new
  end

  # GET /make_records/1/edit
  def edit
  end

  # POST /make_records
  # POST /make_records.json
  def create
    @make_record = MakeRecord.new(make_record_params)

    respond_to do |format|
      if @make_record.save
        format.html { redirect_to @make_record, notice: 'Make record was successfully created.' }
        format.json { render :show, status: :created, location: @make_record }
      else
        format.html { render :new }
        format.json { render json: @make_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /make_records/1
  # PATCH/PUT /make_records/1.json
  def update
    respond_to do |format|
      if @make_record.update(make_record_params)
        format.html { redirect_to @make_record, notice: 'Make record was successfully updated.' }
        format.json { render :show, status: :ok, location: @make_record }
      else
        format.html { render :edit }
        format.json { render json: @make_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /make_records/1
  # DELETE /make_records/1.json
  def destroy
    @make_record.destroy
    respond_to do |format|
      format.html { redirect_to make_records_url, notice: 'Make record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_make_record
      @make_record = MakeRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def make_record_params
      params.require(:make_record).permit(:guid, :userid, :callerid, :source, :destination, :templateid, :dialedtime, :answeredtime, :endtime, :dialstatus, :reason)
    end
end
